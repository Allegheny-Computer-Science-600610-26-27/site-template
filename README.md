# CMPSC 600 Senior Comprehensive Project

For more information about the course requirements for your 600-level course in
Computer and Information Science, please refer to the syllabus for your course.
To enable you to complete many of the deliverables for the 600-level course,
this repository contains the starter for your research journal and your senior
thesis document. Quarto, serving as a build system for your site, will build your
thesis document as a website and a PDF.

## How This Repository Works

Nearly every file you care about is a Quarto (`.qmd`) document, consisting of a
Markdown with a short YAML header. Save the file, run `quarto preview`, and
your work appears in a browser. The table below says which files you edit and
which you leave alone.

| Path | What it is | Edit it? |
|:-----|:-----------|:---------|
| `_quarto.yml` | Site configuration: title, author, navbar, theme | **Yes** — set your name, email, and site title |
| `index.qmd` | Journal home page with the two post listings | Rarely |
| `about.qmd` | Your About page | **Yes** |
| `posts/<category>/` | The seven journal post templates | **Yes** |
| `thesis/index.qmd` | Thesis title page, abstract, and chapter assembly | **Yes** |
| `thesis/_introduction.qmd` … `thesis/_conclusion.qmd` | The five thesis chapters | **Yes** |
| `thesis/references.bib` | Every source you cite | **Yes** |
| `_extensions/ReadyResearchersTemplates/` | The Allegheny CIS PDF format (LaTeX template) | Rarely |
| `.github/workflows/` | GitHub Actions that build the site and release the PDF | No |

## Quick Start: The Steps in Order

1. **Install the tools.** Install Quarto and TinyTeX, then run `quarto
   preview`. See [Installing the Tools](#installing-the-tools).
2. **Personalize the template.** Set your name, email, and site title in
   `_quarto.yml`; set the thesis title, reader names, and author details in
`thesis/index.qmd`; fill in `about.qmd`. See [Personalizing the
Template](#personalizing-the-template).
3. **Write your project contract.** If not finished already, complete the
   `metadata.md` file for the course, including your name, honor code pledge,
repository URLs, and project title, and have your readers approve it. See
[Project Metadata and Contract](#project-metadata-and-contract).
4. **Write your journal posts.** One template per post, in `posts/`. Unless
   there is a pressing need to change the dates, keep each `date` as given in
the [Journal Schedule](#journal-schedule).
5. **Write your thesis chapters.** In the `600` course you complete Chapters
   One and Two; in the `610` course you complete all five chapters. See
[Senior Thesis Chapters](#senior-thesis-chapters).
6. **Build and check the PDF locally.** Run `quarto render thesis/index.qmd
   --to allegheny-cis-pdf` and read the PDF you produced. See [Building the
Site and the PDF Locally](#building-the-site-and-the-pdf-locally).
7. **Publish the journal.** Commit and push to `main`; GitHub Actions builds
   the site and deploys it to GitHub Pages. See [Enabling Site
Build](#enabling-site-build).
8. **Release the thesis PDF.** Tag a commit with a Semantic Versioning number,
   then push with `--tags`. Your readers only read tagged releases. See
[Release Tagging](#release-tagging).
9. **Remove the template text.** Delete every instruction, prompt, and example
   before your final release; the syllabus requires that no template text
remains. See [Removing the Template Text](#removing-the-template-text).

## Course Requirements

### Research Journal

Your research journal contains short posts in one of the following categories:
`reflection`, `feedback`, `activity`, and `changelog`. For the Fall 2026
semester, you are responsible for writing the following posts:

- Two `reflection` posts:
  - Reflect on the current version of your computational artifact
  - Reflect on your experiences preparing for and giving your presentation
- Three `activity` posts:
  - State and explain the title of your senior comprehensive project
  - Provide and justify the outline for Chapter One of your senior thesis
  - Provide and justify the outline for Chapter Two of your senior thesis
- One `feedback` post:
  - Offer feedback to both your classmates and your instructors on work in the
    600-level course in Computer and Information Science
- One `changelog` post:
  - Summarize all work completed leading up to a `1.0` release of your senior
    comprehensive project that is visible through a website hosted on GitHub
    pages and a release of your senior thesis as a PDF document through the
    `Releases` tab inside of your GitHub repository

Your writing assignments for the 610-level course will be released during the
upcoming Spring 2027 semester.

### Journal Schedule

Each post has a template in this repository. Replace the placeholder text in
each template with your own writing, and keep the `date` in the front matter as
given so that your posts appear in the correct order in the journal listing.

| Due date          | Category     | Post                                              | Template                                    |
|:------------------|:-------------|:--------------------------------------------------|:--------------------------------------------|
| Thursday, Nov. 5  | `activity`   | State and explain the project title               | `posts/activity/project-title.qmd`          |
| Thursday, Nov. 5  | `activity`   | Outline of Chapter One                            | `posts/activity/chapter-one-outline.qmd`    |
| Thursday, Nov. 12 | `activity`   | Outline of Chapter Two                            | `posts/activity/chapter-two-outline.qmd`    |
| Thursday, Nov. 12 | `reflection` | Current version of the computational artifact     | `posts/reflection/artifact-reflection.qmd`  |
| Thursday, Nov. 19 | `feedback`   | Feedback on the 600-level course                  | `posts/feedback/course-feedback.qmd`        |
| Thursday, Dec. 3  | `reflection` | Preparing for and giving the presentation         | `posts/reflection/presentation-reflection.qmd` |
| Thursday, Dec. 3  | `changelog`  | Work leading up to the `1.0` release              | `posts/changelogs/release-1.0.qmd`          |

The schedule avoids the Fall 2026 All College Programming Day (Tuesday,
November 3) and the Thanksgiving break (Wednesday-Sunday, November 25-29), so
every due date falls on a Thursday on which the class actually meets. The last
class meeting of the semester is Thursday, December 3. Please consult your
course syllabus for the authoritative due date of each post, as well as for the
expected length and evaluation criteria for each post.

### Senior Thesis Chapters

All researchers in the 600-level course in Computer and Information Science must
document their work in the form of a written thesis. While variations on the
typical structure and contents of a thesis can be specific to a certain project,
a typical Computer and Information Science thesis contains `5` sections:

 1. Introduction
 2. Related Work
 3. Methods
 4. Experiments
 5. Future Work

As outlined on the course syllabus, during the `600` semester course, students
complete Chapters `1` and `2` for review by their reader(s). More details
about the baseline requirements for the senior thesis document are available
in the course syllabus and in the [CONTRIBUTING.md](CONTRIBUTING.md) file.

Each chapter has its own file. The chapters are assembled into a single document
by `thesis/index.qmd`, so you edit the chapter files and never combine them by
hand:

| Chapter | File | Written in |
|:--------|:-----|:-----------|
| One: Introduction | `thesis/_introduction.qmd` | `600` |
| Two: Related Work | `thesis/_related_work.qmd` | `600` |
| Three: Method of Approach | `thesis/_methods.qmd` | `610` |
| Four: Experiments | `thesis/_experiments.qmd` | `610` |
| Five: Conclusion, Future Work | `thesis/_conclusion.qmd` | `610` |

Every chapter file contains HTML comments (`<!-- ... -->`) with writing guidance.
Those comments stay in the source file and never appear in the PDF or the
website, so read them while you draft and leave them in place.

According to the course schedule, the final version of Chapters One and Two and
the finalized computational artifact are due on **December 10, 2026 by 11:59 PM**.
Please confirm this date in your syllabus, which is the authoritative source for
all deadlines.

## Course Technology Use

### Installing the Tools

You need three things installed on your own computer. All of them are free.

1. **Git** — for committing, tagging, and pushing. Verify with `git --version`.
2. **Quarto** (version `1.6` or newer) — the build system. Install it from
   <https://quarto.org/docs/get-started/> and verify with `quarto --version`.
3. **TinyTeX** — the LaTeX distribution used to build the thesis PDF. Install
   it once from a terminal with `quarto install tinytex`. Please note that it
is also possible to use a full LaTeX distribution for your senior comprehensive
project's chapters. With that said, we advise that you use TinyTeX, as it is a
lightweight LaTeX distribution that is easy to install and quick run. You do
not need to install LaTeX packages one by one; Quarto adds any package that a
template requests.

### Personalizing the Template

Before you write anything, replace the placeholder values that ship with this
template. If you skip this step, your PDF title page will not carry your name.

- `_quarto.yml` — the `author` block (name and email) and the `website: title`
  of your journal.
- `thesis/index.qmd` — the `title`, `firstreader`, and `secondreader` fields,
  the `author` block, and the `abstract`.
- `about.qmd` — the text of your About page and the link to your GitHub profile.
- `profile.jpg` — replace it with your own photograph, or delete the reference
  to it in `about.qmd`.

### Building the Site and the PDF Locally

Always preview your work before you push it. From the root of the repository:

```bash
# Live preview of the journal in a browser (press Ctrl+C to stop)
quarto preview

# Build the whole project once: the journal site plus the thesis PDF
quarto render

# Build only the thesis PDF
quarto render thesis/index.qmd --to allegheny-cis-pdf
```

Output always lands in `_site/`, because that directory is set by
`output-dir` in `_quarto.yml`:

| Command | Produces |
|:--------|:---------|
| `quarto render` | `_site/index.html` (journal) and `_site/thesis/index.pdf` |
| `quarto render thesis/index.qmd` | `_site/thesis/index.html` and `_site/thesis/index.pdf` |
| `quarto render thesis/index.qmd --to allegheny-cis-pdf` | `_site/thesis/index.pdf` only |

Three things that sometimes surprise students:

- **`quarto preview` does not build the PDF.** It serves the HTML version of the
  journal and skips the PDF. Run `quarto preview --render all` if you want the
  PDF produced when the preview starts. Preview also watches only the documents
  it rendered, not the chapter partials those documents include, so saving
  `thesis/_methods.qmd` does **not** refresh `thesis/index.html` or the PDF.
  After you edit a chapter, run
  `quarto render thesis/index.qmd --to allegheny-cis-pdf` to see the change.

- **Do not render a chapter file directly.** Running
  `quarto render thesis/_methods.qmd` fails with
  `Unable to read the extension 'allegheny-cis'`, because chapter files are
  partials that only make sense inside `thesis/index.qmd`. To build a subset of
  chapters, comment out the ones you do not want inside `thesis/index.qmd`:

```markdown
{{< include _introduction.qmd >}}
{{< include _related_work.qmd >}}
<!-- {{< include _methods.qmd >}} -->
```

- **A local PDF is not a submission.** Your readers only read PDFs attached to
  a tagged GitHub release, which is the step described in
  [Release Tagging](#release-tagging).

Local builds require TinyTeX and can take a minute or two, because the PDF is
compiled three times by LaTeX so that cross-references and the bibliography
resolve correctly.

### Enabling Site Build

This site deploys via Github Pages using the Quarto static site building
system. The following instructions are representative in nature and may require
customization for each student depending on their own GitHub settings and
repository configuration. Please contact your first reader, second reader, or
the coordinator for your 600-level course if you have any questions about
enabling site build for your research journal. With that said, each student
researcher should invest the time needed to troubleshoot the setup of their own
research journal and the deployment of it to GitHub Pages. Please note that a
working deployment should also feature a link to the PDF that contents the
chapters of your senior thesis. The following steps are provided to help you
enable site build for your research journal:

1. Go to the `Settings` menu on this repository and locate the `Pages` submenu.

![GitHub Settings, Pages submenu](https://raw.githubusercontent.com/ReadyResearchersTemplates/site-template/media/img/600%20-%20Site%20Template%20-%20Github%20Pages%20Menu.png)

2. On the resulting screen, find the `Build and deployment` menu; select `GitHub Actions`

![GitHub pages, Build and Deployment item](https://raw.githubusercontent.com/ReadyResearchersTemplates/site-template/media/img/600%20-%20Site%20Template%20-%20Github%20Actions%20Menu.png)

### `Private` vs. `Public` availability

You retain the choice to make your research journal private or public; the
`Pages` settings menu should allow either. Your URL will change depending on
which selection you make, and you should be able to find the resulting URL of
your journal by visiting the pages section of the repository's `Settings` menu.
Your URL should display at the top of the page:

![GitHub Pages url](https://raw.githubusercontent.com/ReadyResearchersTemplates/site-template/media/img/600%20-%20Site%20Template%20-%20Github%20URL.png)

### Release Tagging

Since this repository primarily contains Markdown and/or LaTeX source code, the
GitHub Actions configuration for it will compile the source code and
automatically release a PDF of the main file whenever the last commit is
associated with a [Git
Tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging).

This will build a PDF file available in the "Releases" listing for this
repository. All release numbers for your writing in this repository should
adhere to the [Semantic Versioning](http://semver.org/) standard expected of
GitHub projects. Here this means that:

- `Major version` releases feature a tag number change reflecting full
releases; generally these start at `1.0.0`
- `Minor version` releases indicate small changes or additions to documents;
typically these increment the second digit in the version (e.g. `1.1.0`)

Please note that your readers will only read the PDF generated from "tagged"
releases of the file `SeniorThesis.pdf`. The version thresholds differ by course:

| Course | Minimum release your readers will evaluate |
|:-------|:-------------------------------------------|
| `600` | a release greater than `1.0.0` |
| `610` | a release greater than `2.0.0` |

That is:

- if your commit is tagged `SeniorThesis-1.0.0`, then
- the file `SeniorThesis.pdf` should be available for download in the
"Releases" tab in your GitHub repository for this project under the name
`SeniorThesis-1.0.0`.

Any tag that contains two dots triggers the release, for example `1.0.0` or
`SeniorThesis-1.0.0`. A tag such as `v1` or `final` silently does nothing,
because the workflow listens for the pattern `*.*.*`.

#### Checking workflow permissions first

GitHub Actions can only create a release if the repository grants it write
access. Before you tag anything, open `Settings` → `Actions` → `General`, scroll
to `Workflow permissions`, and confirm that `Read and write permissions` is
selected. If it is not, your tag will build the PDF but the release step will
fail with a permission error.

#### The release sequence, step by step

1. Make your changes to the chapter files and review them with `quarto render`
   or `quarto preview`.
2. Check what you are about to commit: `git status` and `git diff`.
3. Commit your changes: `git commit -am "Revise Chapter One"`.
4. Create the tag on that commit: `git tag SeniorThesis-1.0.0`.
5. Push both the commit and the tag: `git push -u origin main --tags`.
6. Open the `Actions` tab and confirm the `Release Senior Thesis` workflow
   succeeds.
7. Open the `Releases` tab and confirm that `SeniorThesis-1.0.0` is attached.

If you tag the wrong commit, delete the tag with `git tag -d
SeniorThesis-1.0.0`, delete it on the remote with `git push origin --delete
SeniorThesis-1.0.0`, and tag again. Please note that these steps were written
from the perspective of a student who had finished minor releases below `1.0`
and was now ready to make the first major release of their senior thesis. If
you are a student who is starting off with their first tagged release, please
make sure that you use a `0.1.0` and then increase the version number according
to the Semantic Versioning Standard.

The above steps should build a version of your project and release it on GitHub!
If something does not work correctly, please contact your first and second
readers and/or the senior thesis faculty coordinator to explain the details of
the challenges that you faced. It is also important to note that it is possible
for a student to perform a manual release of the PDF of their senior thesis
chapters. Again, please communicate with your first and/or second readers and/or
the senior thesis faculty coordinator for more information about the steps you
would take to perform a manual release. With that said, it is important to
stress that you should learn how to perform an automated release of your thesis
in PDF and only use the manual approach if there is a severe and extenuating
circumstance (e.g., GitHub Actions stops working for a short time) that prevents
you from performing an automated release.

When you make subsequent changes to your files and perform commits and you are
ready to release a new version of `SeniorThesis.pdf`, then you should
again tag your work _before a `push` command_ with a tag that
adheres to the [Semantic Versioning](http://semver.org/) standard.

Each time that you correctly execute this sequence of commands you will release
a new version of your document to GitHub that is easily accessible as a PDF to
you and to your first and second readers.

While you are able to build copies of your PDF locally using the `quarto render`
command, the only copy that will be evaluated is that released to GitHub following
the procedure outlined above.

### Removing the Template Text

This repository is a starter, so it is full of instructions. The syllabus
requires that no template text remains in the thesis you submit, and your
readers will notice if it does. Before your final release:

1. Delete the whole `# Template description` section of `thesis/index.qmd`,
   from that heading down to the sentence `Direct any questions about issues to
   your first reader.`
2. Replace the placeholder `abstract` in `thesis/index.qmd` with a summary of
   your own work.
3. Replace the `title`, `firstreader`, `secondreader`, and `author` values.
4. Delete the prompt paragraphs in each chapter file that begin with
   `This chapter ...` or `This document requires ...`, and delete the
   `## Motivation`-style placeholder headings you did not use.
5. Open the built PDF and check the table of contents: every entry should be
   something you wrote.

Writing guidance in the chapter files lives inside HTML comments
(`<!-- ... -->`), which Quarto strips from both the PDF and the website, so
you can leave those in place without violating this requirement.

## Project Metadata and Contract

The course requires a project contract in addition to the files in this
repository. The contract is recorded in the `metadata.md` file of the course
syllabus repository and asks for:

- your full name and GitHub username;
- an honor code pledge;
- the URL of this repository (thesis chapters and research journal);
- the URL of your computational artifact repository;
- the title of your senior comprehensive project;
- any additional requirements, approved schedule changes, or approved
  regulations concerning the use of artificial intelligence tools;
- for a double major, the requirements of your additional major; and
- signed acknowledgement that both of your readers reviewed and approved the
  contract.

Keep the project title identical in `metadata.md`, `_quarto.yml`, and
`thesis/index.qmd`. If your project involves human subjects, you must have an
approved Institutional Review Board (IRB) proposal **before** you run any
experiment; your first reader submits it on your behalf. Review the syllabus
sections on the honor code, the IRB, and the use and documentation of
artificial intelligence tools before you begin writing.

## Troubleshooting

| Symptom | Cause and fix |
|:--------|:--------------|
| `Unable to read the extension 'allegheny-cis'` | You rendered a chapter partial. Render `thesis/index.qmd` instead. |
| LaTeX error about a missing package or font | Run `quarto install tinytex`, then render again. |
| The tag built a PDF but no Release appeared | The tag has fewer than two dots, or Actions lacks write permission. See [Release Tagging](#release-tagging). |
| The journal site shows an old version | The Pages deployment failed or is still running. Check the `Actions` tab, then hard-refresh the browser. |
| A journal post is missing from the listing | The post has no `date` in its YAML header, or the post is not inside a folder listed in `index.qmd`. |
| The PDF still contains template text | You have not completed [Removing the Template Text](#removing-the-template-text). |
| Charts or figures overflow the page | Reduce the figure width in the chunk options (for example `#| fig-width: 4`). |

## Seeking Assistance

If you are having trouble completing any part of this project, then please talk
with your first reader, second reader, or the coordinator for your 600-level
course. In particular, if you have questions about your research project, please
see your first reader. Students who want to learn more about [Managing
releases in a GitHub
repository](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository)
or other topics related to release management on GitHub are encouraged to check
the [GitHub Releases
Documentation](https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases).
