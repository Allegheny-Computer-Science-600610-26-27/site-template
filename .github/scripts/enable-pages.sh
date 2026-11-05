#!/usr/bin/env bash
#
# Enable GitHub Pages (source: GitHub Actions) on every repository in an
# organization, or on a single repository.
#
# Why you need this: a GitHub Actions workflow cannot create the Pages site for
# its own repository. GITHUB_TOKEN is not allowed to call "Create a GitHub Pages
# site" (see actions/configure-pages issue #48), so every fresh repository that a
# student accepts reaches the "Configure Pages" step, gets a 404, and has no site
# to deploy to. A repository owner or organization owner must enable Pages once,
# after which every build deploys with no further intervention.
#
# Requirements: the GitHub CLI (`gh`), authenticated with an account that has
# admin rights on the target repositories. Verify with:
#
#   gh auth status
#
# Usage:
#
#   ./enable-pages.sh [--dry-run] ORG [NAME-FILTER]
#   ./enable-pages.sh [--dry-run] --repo OWNER/NAME
#
# Options:
#
#   --dry-run   Report what would change and change nothing.
#
# Examples:
#
#   # Preview the whole organization first
#   ./enable-pages.sh --dry-run Allegheny-Computer-Science-600610-26-27
#
#   # Then enable it for the repositories you actually deploy
#   ./enable-pages.sh Allegheny-Computer-Science-600610-26-27 site-template
#   ./enable-pages.sh Allegheny-Computer-Science-600610-26-27 -site
#   ./enable-pages.sh --repo Allegheny-Computer-Science-600610-26-27/site-template
#
# The script is idempotent: it reports "ok" for repositories that already build
# with GitHub Actions, "updated" for repositories that publish from a branch, and
# "enabled" for repositories that had no Pages site.

set -euo pipefail

usage() {
  sed -n '2,32p' "$0" | sed 's/^# \{0,1\}//'
  exit "${1:-1}"
}

dry_run=0
args=()
for arg in "$@"; do
  case "$arg" in
    --dry-run) dry_run=1 ;;
    -h | --help) usage 0 ;;
    *) args+=("$arg") ;;
  esac
done

if [[ ${#args[@]} -lt 1 ]]; then
  usage 1
fi
set -- "${args[@]}"

command -v gh >/dev/null 2>&1 || {
  echo "error: the GitHub CLI (gh) is not installed" >&2
  exit 1
}

repos=()
if [[ "$1" == "--repo" ]]; then
  [[ $# -lt 2 ]] && usage 1
  repos=("$2")
else
  org="$1"
  filter="${2:-}"

  while read -r name; do
    [[ -z "$name" ]] && continue
    if [[ -z "$filter" || "$name" == *"$filter"* ]]; then
      repos+=("$org/$name")
    fi
  done < <(gh repo list "$org" --limit 1000 --json name -q '.[].name')
fi

if [[ ${#repos[@]} -eq 0 ]]; then
  echo "No repositories matched."
  exit 0
fi

echo "Inspecting ${#repos[@]} repository/repositories."
[[ $dry_run -eq 1 ]] && echo "Dry run: nothing will be changed."
echo

enabled=0
updated=0
ok=0
planned=0
failed=0

for slug in "${repos[@]}"; do
  # `gh` exits non-zero when there is no Pages site, but still writes the error
  # body to stdout, so the exit status, not the output, decides what happened.
  exists=0
  build_type=""
  if raw="$(gh api "repos/$slug/pages" -q '.build_type' 2>/dev/null)"; then
    exists=1
    build_type="$raw"
  fi

  if [[ $exists -eq 1 && "$build_type" == "workflow" ]]; then
    printf '  ok            %s (already builds with GitHub Actions)\n' "$slug"
    ok=$((ok + 1))
    continue
  fi

  if [[ $dry_run -eq 1 ]]; then
    if [[ $exists -eq 0 ]]; then
      printf '  would enable  %s (no Pages site)\n' "$slug"
    else
      printf '  would update  %s (currently %s)\n' "$slug" "${build_type:-unknown}"
    fi
    planned=$((planned + 1))
    continue
  fi

  if [[ $exists -eq 0 ]]; then
    # No Pages site yet: create one that publishes from GitHub Actions.
    if gh api --silent -X POST "repos/$slug/pages" -f build_type=workflow 2>/dev/null; then
      printf '  enabled       %s\n' "$slug"
      enabled=$((enabled + 1))
    else
      printf '  FAILED        %s (need admin rights on this repository)\n' "$slug"
      failed=$((failed + 1))
    fi
  else
    # A Pages site exists but publishes from a branch: switch it to Actions.
    if gh api --silent -X PUT "repos/$slug/pages" -f build_type=workflow 2>/dev/null; then
      printf '  updated       %s (was %s, now GitHub Actions)\n' "$slug" "${build_type:-unknown}"
      updated=$((updated + 1))
    else
      printf '  FAILED        %s (was %s)\n' "$slug" "${build_type:-unknown}"
      failed=$((failed + 1))
    fi
  fi
done

echo
if [[ $dry_run -eq 1 ]]; then
  printf 'dry run: %d would change, %d already ok\n' "$planned" "$ok"
else
  printf 'enabled %d, updated %d, already ok %d, failed %d\n' \
    "$enabled" "$updated" "$ok" "$failed"
fi

[[ $failed -eq 0 ]] || exit 1
