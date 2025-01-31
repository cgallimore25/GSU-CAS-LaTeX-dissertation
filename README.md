# GSU-CAS-LaTeX-dissertation

As of Spring 2025, this LaTeX template is the one officially supplied by the Georgia State University (GSU) College of Arts & Sciences (CAS). 
It was first written in 2006. 
This online repository hosts more up-to-date versions of its included packages, as well as incorporates new ones, while preserving all of the formatting initially defined by the class file. 
Although certain choices in this template were made specifically for Neuroscience Institute dissertations (e.g. citation style), any and all of these properties can be customized to the conventions of your field. 

This template was developed on a Windows 10 machine using: 
- TeX Live 2024
- VS Code `v1.96.4`
- Perl `v5.40.0`
- Git `v2.47.1` 

## Installation

[![LaTeX](https://img.shields.io/badge/latex-%23008080.svg?style=for-the-badge&logo=latex&logoColor=white)](https://www.tug.org/texlive/)
[![Perl](https://img.shields.io/badge/perl-%2339457E.svg?style=for-the-badge&logo=perl&logoColor=white)](https://strawberryperl.com/)
[![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)](https://code.visualstudio.com/download)
[![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)](https://git-scm.com/downloads)

This repository was specifically designed for a Git + VS Code workflow using the [LaTeX Workshop](https://github.com/James-Yu/LaTeX-Workshop) extension. The main motivations for implementing the template in this way were:
1. It is entirely open-source
2. It enables and encourages rigorous version control (VC)
3. VS code is an aesthetically pleasing, highly customizable text editor with great VC integration and text auto-completion functionalities (which default LaTeX editors, e.g. TeXworks, often lack). 

Version controlling with Git is by no means required, but is recommended for documents of this size.

The above icons link to installations. 
After installing requisite software, just download this repository as a zip file and extract it to wherever you'd like. 
You can then set-up your own Github remote repo where you version control your dissertation and push your changes regularly.

***Important considerations***:
- TeX Live is the **strongly recommended** [LaTeX distribution](https://github.com/James-Yu/latex-workshop/wiki/Install) by developers of the VS Code LaTeX Workshop extension. TeX Live binaries must then be added to your `PATH` environment variables. See [here](https://www.computerhope.com/issues/ch000549.htm) for Windows.
- Installing Strawberry Perl regardless of the LaTeX distribution you choose is recommended. It is completely free, and must also be added to `PATH`.
- If you are GSU student/faculty/staff, the Software Center for GSU networked machines supplies VS Code — while VS code is ultimately open-source, sometimes it's best to go through the Software Center when available. 
- For machines where ***you do not have admin rights***, I recommend installing all of the above to your User directory to circumvent possible admin issues. If you are certain you ***do*** have admin rights, the above softwares can be installed to your system drive. 

## Structure

### Class and package files

The `gsudiss.cls` class file defines macros and commands to structure different page types (e.g. the abstract, table of contents, figure, table, and abbreviation lists) programmtically, automating the format of your document. Both class `.cls` and style `.sty` files are located in the 
> "is made up of various macros and packages to make the outline and formatting of your dissertation easier. 
It is by no means applicable to the entire Georgia State System. 
Those of you who want to use LaTeX to prepare your dissertation, and who are not from CAS, however, can use this style file as a guide to make their own. 
This file was developed to allow a wide range of formatting options, but users should bear in mind that the dissertation guide allows limited formatting beyond the supplied templates. 
This style file does not guarantee the satisfaction of all requirements specified by GSU CAS in perpetuity. 
Styles change on a yearly basis and it is up to you (the writer or author) to follow all requirements specified by your specific college or department".

### Settings

The `settings.json` file in [.vscode](https://github.com/cgallimore25/GSU-CAS-LaTeX-dissertation/tree/main/.vscode) defines the VS code settings you'd like to use. 
May be helpful to review official [documentation](https://code.visualstudio.com/docs/getstarted/settings#_settings-file-locations). 
This file is intended to be project-specific, and a ***wide*** variety of LaTeX Workshop [compilation](https://github.com/James-Yu/LaTeX-Workshop/wiki/Compile) rules and recipes can be defined here. 
The provided settings are rather minimalist, explicitly defining the citation backend and build recipe (`biblatex`, and `latexmk`, respectively), as well as some auto-cleaning of auxiliary files and "synctex" for snapping PDF interactions to location in code, and vice versa from code to PDF. 


### Directories

The core design of this repository is as a [multi-file project](https://github.com/James-Yu/LaTeX-Workshop/wiki/Compile#multi-file-projects), where individual Chapters have their own [directory](https://github.com/cgallimore25/GSU-CAS-LaTeX-dissertation/tree/dev/Chapters), and each section has its own `.tex` file which are incorporated in the chapter file (e.g. `Chapter_XX.tex`) using `\subfile{}` commands. 
Structuring the project in this way confers a few advantages, namely:
1. The ability to work on and view specific sections in isolation without compiling/viewing the entire document.
2. The ability to version control (edit, commit, and push) individual section files separately, giving them their own history. 

This design is also favorable for liberal use of git `branches`, allowing you to keep track of different "states" of the work. 
While the `main` (or `master`) branch of your repository should always have the most current, "ready to publish" state, creation of separate `branches` allow you to prepare other versions (e.g. `advisor-edits`, or `journal-submission`) that you can maintain and develop in isolation without affecting the main body of work. 

Another great feature of a multi-file structure is that we implement the `subfiles` package, which allows us to compile individual chapter sections directly.
This gives us the option to do more focused work on a specific section (since dissertation sections can be quite long) without worrying about compiling or looking at the entire document.

**NOTE:** One useful command for keeping your Chapters directory clean of auxiliary files after individual section compilation is to run the below snippet in your VS Code integrated powershell terminal (you'll know your terminal is powershell by navigating over to "Terminal" in the debug console at the very bottom, and seeing `PS ` beside your project's absolute path)

```powershell
gci .\Chapters -r *.tex | % { pushd $_.Directory; latexmk -C $_; popd }
```

## Citation style

If you've worked with LaTeX before, you know that citation formatting can be one of the largest, most painful hurdles. 
Fortunately, you only have to solve it once. And here, it already is.

### Default

The default style implemented here is superscripted citations using the Springer Nature style (Biblatex, with Biber backend), where article titles follow sentence casing.
This choice was a personal preference based on the style's compactness (and the fact that it doesn't seem to be strictly specified by CAS in Neuroscience dissertations I've seen). 

Citation style can be changed by modifying the arguments to `\usepackage[...]{biblatex}` in `main.tex`.
This part will take some research — there is no "one size fits all" procedure for getting the citation style you want. 
You may have to change the citation backend, you may have to download alternative `.bst` files.
YMMV.
The important thing is that you land on something that meets your requirements and it compiles correctly. 

### Generating the .bib file

I recommend creating your bibliography in [Zotero](https://www.zotero.org/), an open-source reference manager (also available in GSU's Software Center), using the [Better BibTeX](https://github.com/retorquere/zotero-better-bibtex) (BBT) for Zotero plugin.
This extension is better optimized for text-based toolchains such as LaTeX and Markdown. 

## Obscure possible errors

Be careful using the `-pvc` (preview continuous) flag in latexmk. 
It creates a persistent Perl daemon that watches your files and automatically rebuilds them when changes are detected. 
Safe ways to use `-pvc`:

Through VS Code LaTeX Workshop's controlled environment, set it in `settings.json`, allowing VS Code to manage the process lifecycle:

```json
"latex-workshop.latex.recipe.default": "latexmk (pvc)",
"latex-workshop.latex.tools": [
  {
    "name": "latexmk (pvc)",
    "command": "latexmk",
    "args": [
      "-pvc",
      "-pdf",
      "-interaction=nonstopmode",
      "-synctex=1",
      "%DOC%"
    ]
  }
]
```

A safer command line approach is:

```bash
latexmk -pvc -pdf main.tex
```

Then to stop it with Ctrl+C in the same terminal window, properly terminating the watching process.

Cautions in `-pvc` mode

- Don't close VS Code/terminal without properly stopping the pvc process
- Don't delete output files while pvc is running (it'll keep trying to regenerate them)
- Always use Ctrl+C to stop the process, don't just close the window

If things do get stuck:

- Find and kill the perl.exe process in Task Manager
- Clean auxiliary files AFTER killing the process
- Start fresh with a new build
