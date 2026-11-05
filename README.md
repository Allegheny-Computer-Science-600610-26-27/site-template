# CMPSC 600 Senior Comprehensive Project

[![Build Research Journal Site](../../actions/workflows/main.yml/badge.svg)](../../actions/workflows/main.yml)
[![Release Senior Thesis](../../actions/workflows/release.yml/badge.svg)](../../actions/workflows/release.yml)

For more information about the course requirements for your 600-level course in
Computer and Information Science, please refer to the syllabus for your course.
To enable you to complete many of the deliverables for the 600-level course,
this repository contain contains instructions for your research journal and your
senior thesis document. Quarto, serving as a build system for your site, will
build your thesis document as a website and a PDF.

## Course Requirements

### Research Journal

Your research journal contains short posts in one of the following categories:
`reflection`, `feedback`, `activity`, and `changelog`. For the Fall 2025
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
upcoming Spring 2026 semester.

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

## Course Technology Use

### Enabling Site Build

This site deploys via Github Pages using the Quarto static site building system.

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

* `Major version` releases feature a tag number change reflecting full
releases; generally these start at `1.0.0`
* `Minor version` releases indicate small changes or additions to documents;
typically these increment the second digit in the version (e.g. `1.1.0`)

Please note that your readers will only read the PDF generated from "tagged"
releases of the file `SeniorThesis.pdf` that has a version number greater than
1.0.0.

That is:

* if your commit is tagged `SeniorThesis-1.0.0`, then
* the file `SeniorThesis.pdf` should be available for download in the
"Releases" tab in your GitHub repository for this project under the name
`SeniorThesis-1.0.0`.

To ensure you can create a release appropriately, make a single small change to
the `thesis/index.qmd` and:

1. Use `git` to `commit` your file changes using a `git commit` command
2. Create your first tag for this repository: type `git tag
   senior_thesis-0.1.0`.
3. You are now ready to push your changes with the tag number using  `git push
   -u origin main --tags`

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
