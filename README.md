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

## Design

This repository was specifically designed for a Git + VS Code workflow using the [LaTeX Workshop](https://github.com/James-Yu/LaTeX-Workshop) extension. 
The main motivations for implementing the template in this way were:
1. It is entirely open-source
2. It enables and encourages rigorous version control (VC)
3. It employs a user-friendly, highly customizable text editor (VS Code) with great VC integration and text auto-completion functionalities (often lacking in default LaTeX editors, e.g. TeXworks). 

Version controlling with Git is by no means required, but is recommended for documents of this size, and compatibility with branching.

## Determining the right distribution for you

### Option 1:

If distribution size is no concern for you, install the TeX Live full distribution (~9 GB). It will take a while, but it comes with ***everything***, meaning you have it all on your local machine. 

This gives you:
1. The easiest configuration for adding new packages to your document whenever you want
2. The most portability to work completely offline, and
3. The full range of local and remote version control capabilities (e.g. branching) with Git

You pay for that level of control with computer memory. And the LaTeX badge in the  [procedure](#installation-procedure) below will take you to this option. 

### Option 2:

If you need to be conservative with your computer's storage space (we've all hammered out a thesis on a 5-year old laptop on its last legs), then I recommend installing [TinyTex](https://yihui.org/tinytex/), compatible with Mac, Windows, and Linux. 
I include a procedure for a *very* lean distribution (~650 MB). 

You pay for this compactness with more complexity, and will at some point or another need to become comfortable using only one command in the terminal — `tlmgr` — to install missing pieces if necessary. 
I provide a `required_packages.txt` file and some suggested installation routines (see [Step 3](#step-3) below). 
This, also being a local installation, is compatible with full Git functionality.

***Takeaway***: Use a local installation of a LaTeX distribution if offline work and version control are important to you.

### Option 3:

If version control is not important to you, and you're looking for a user-friendly, cloud-based LaTeX alternative that you can easily collaborate with colleagues on real-time, this set-up should be fully compatible with Overleaf.
Just move all files from the [Styles](/Styles/) directory to the main project directory where `main.tex` is.

***Drawbacks:*** 
You forfeit autonomy when you opt for cloud-based over local.
- Git integration through Overleaf directly requires a premium subscription. 
You may be able to version control locally using command line Git without an Overleaf subscription, but I have not pursued this avenue. 
- You will only be able to work on this document with an internet connection. 
If Overleaf's servers are down, you cannot write. 

## Installation procedure

[![LaTeX](https://img.shields.io/badge/latex-%23008080.svg?style=for-the-badge&logo=latex&logoColor=white)](https://www.tug.org/texlive/)
[![Perl](https://img.shields.io/badge/perl-%2339457E.svg?style=for-the-badge&logo=perl&logoColor=white)](https://strawberryperl.com/)
[![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)](https://code.visualstudio.com/download)
[![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)](https://git-scm.com/downloads)

***Read these steps before going forward with any of the above icons linked to installations.***


### Step 0: 
Download and extract this repository as .zip file to a directory of your choosing (Probably your `Documents` folder, or the like).
We'll come back to this directory in Step 3. 

**[Optional]:** install Git as well. 


### Step 1:

| Admin Rights   | Yes     | No |
| :----------:   | :------: | :-----: |
| Perl Installer | MSI *or* Portable zip | Portable zip    |


If you ***don't*** have admin rights on your computer, select the Portable zip installer in the Strawberry Perl badge link above and extract it to a new folder in your user directory (e.g. `C:/Users/myName/strawberry/`). 

If you ***do*** have admin rights, you can use the MSI installer if you want it to be available to any user on the system, or portable for a custom directory. 

Add the 
1. `C:/Users/myName/strawberry/perl/bin`
2. `C:/Users/myName/strawberry/perl/site/bin`, and 
3. `C:/Users/myName/strawberry/c/bin` 

directories to your `PATH` by editing environment variables for your user account [[Windows](https://www.computerhope.com/issues/ch000549.htm) | [MacOS](https://techpp.com/2021/09/08/set-path-variable-in-macos-guide/)]


### Step 2:

| Operating System | Windows  | MacOS   |  Linux  |
| :--------------: | :------: | :-----: | :-----: |
| TeX distribution | [TeX Live](https://www.tug.org/texlive/) *or* [TinyTex](https://yihui.org/tinytex/) | [TinyTex](https://yihui.org/tinytex/) *or* [MacTeX](https://www.tug.org/mactex/mactex-download.html) |  [TinyTex](https://yihui.org/tinytex/)

Install LaTeX, if you want your distribution local. 

For a lean distribution (~650 MB), go with TinyTex. 
Downloading the `install-bin-windows.bat` referenced in their docs (for Windows) to the basic `Downloads` directory then double-clicking will automatically create a the TinyTex install directory in `User/AppData/Roaming` and add it to the user `PATH` (bearing in mind you may not have admin rights). 

Follow the respective steps in their linked docs for Mac or Linux.

***NOTE:*** 
- TeX Live is the **strongly recommended** [LaTeX distribution](https://github.com/James-Yu/latex-workshop/wiki/Install) by developers of the VS Code LaTeX Workshop extension, and all of the links here provide TeX Live dists. If you *really* want to use MiKTeX, I leave that up to you. 
- TeX Live binaries (e.g. `C:/Users/myName/texlive/2024/bin/windows`) must then be added to your `PATH` environment variables. 

To verify your distribution is on the path, you can search `cmd` in the Windows Search bar, then run: 
```cmd
echo %PATH%
```

or in a MacOS/Linux terminal:
```bash
echo $PATH
```

The below `tlmgr` commands are common across all OS.


| Function              |       Command            |
| :-------------------: | :----------------------: |
|`tlmgr` accessibility  |    `tlmgr --version`     |
| package installation  | `tlmgr install biblatex` |
| package location      |  `kpsewhich package.sty` |
| package update        |   `tlmgr update --all`   |
| manager update        |   `tlmgr update --self`  |



### Step 3:

This step runs a useful terminal command that installs remaining dependencies listed in `required_packages.txt`, which aren't supplied by our [Styles](/Styles/) subdirectory. 

***NOTE:***
- If you installed a larger TeX Live distribution, you may not need the below commands.
Though running them won't do any harm.
- If you went with the compact TinyTex distribution, then proceed.

On a Windows machine, navigate to your extracted directory in the `cmd` terminal (Windows may autocomplete with backslashes)
```cmd
cd path/to/extractedDir
```

Then run the below terminal command from inside your extracted template project directory that installs other standalone package requirements:
```cmd
for /f "delims=" %i in (required_packages.txt) do tlmgr install %i
```

For MacOS/Linux, you can try these `bash` commands from the project dir:

```bash
while read package; do
    tlmgr install "$package"
done < required_packages.txt
```

Or for loop:

```bash
for package in $(cat required_packages.txt); do
    tlmgr install "$package"
done
```


### Step 4:

Now that you have your TeX distribution and Perl available to the path, as well as all the packages we'll need, make sure you have VS Code installed.

***NOTE:***
- If you are GSU student/faculty/staff, the Software Center for GSU networked machines supplies VS Code — while VS code is ultimately open-source, sometimes it's best to go through the Software Center when available. 

After installing Strawberry Perl, your preferred LaTeX distribution, VS Code, and Git (Optional), and all are on your user `PATH`, proceed with installing the LaTeX Workshop extension in VS Code:
1. Open VS Code by right-clicking in a blank space of your template subdirectory in file explorer/finder and click "Open with Code". 
2. In VS Code, click Extensions in the far left-side pane, search for `LaTeX Workshop`, then install it. 

Once the extension is installed, you should be able to compile (play button in the top right corner) while on the open file `main.tex`. 

Happy TeX'ing!

## Structure

### Class and package files

The `gsudiss.cls` class file defines macros and commands to structure different page types (e.g. the abstract, table of contents, figure, table, and abbreviation lists) programmtically, automating the format of your document. Both class `.cls` and pre-supplied style `.sty` files are located in the [Styles](/Styles/) subdirectory of this template. 


### Settings

The `settings.json` file in [.vscode](/.vscode/) defines the VS code settings you'd like to use. 
May be helpful to review official [documentation](https://code.visualstudio.com/docs/getstarted/settings#_settings-file-locations). 
This file is intended to be project-specific, and a ***wide*** variety of LaTeX Workshop [compilation](https://github.com/James-Yu/LaTeX-Workshop/wiki/Compile) rules and recipes can be defined here. 

The provided settings are rather minimalist, explicitly defining the citation backend and build recipe (`biblatex`, and `latexmk`, respectively), as well as some auto-cleaning of auxiliary files and "synctex" for snapping PDF interactions to location in code, and vice versa from code to PDF. 


### Directories

The core design of this repository is as a [multi-file project](https://github.com/James-Yu/LaTeX-Workshop/wiki/Compile#multi-file-projects), where individual Chapters have their own [directory](/Chapters/), and each section has its own `.tex` file which are incorporated in the chapter file (e.g. `Chapter_XX.tex`) using `\subfile{}` commands. 
Structuring the project in this way confers a few advantages, namely:
1. The ability to work on and view specific sections in isolation without compiling/viewing the entire document.
2. The ability to version control (edit, commit, and push) individual section files separately, giving them their own history. 

This design is also favorable for liberal use of git `branches`, allowing you to keep track of different "states" of the work. 
While the `main` (or `master`) branch of your repository should always have the most current, "ready to publish" state, creation of separate `branches` allow you to prepare other versions (e.g. `advisor-edits`, or `journal-submission`) that you can maintain and develop in isolation without affecting the main body of work. 

Another great feature of a multi-file structure is that we implement the `subfiles` package, which allows us to compile individual chapter sections directly.
This gives us the option to do more focused work on a specific section (since dissertation sections can be quite long) without worrying about compiling or looking at the entire document.

***NOTE:*** 
- If you're compiling individual sections, one useful utility command for keeping your Chapters directory clean of auxiliary files is to run the below snippet in your VS Code integrated powershell terminal (you'll know your terminal is powershell by navigating over to "Terminal" in the debug console at the very bottom, and seeing `PS ` beside your project's absolute path)
- This clean-up routine clears out LaTeX compilation artifacts

```powershell
gci .\Chapters -r *.tex | % { pushd $_.Directory; latexmk -C $_; popd }
```

## Git guides

This repository incorporates a [git-guides](/git-guides/) submodule, a small collection of markdown cheatsheets to reference while getting comfortable with Git. 

If you have a suggestion for a new git guide that would cover operations currently not present, try having Claude or ChatGPT generate one for you in Markdown (`.md`), then make a pull request on the [git-guides repo](https://github.com/cgallimore25/git-guides). 

## Citation style

If you've worked with LaTeX before, you know that citation formatting can be one of the largest, most painful hurdles. 
Fortunately, you only have to solve it once. And here, it already is.

### Default

The default style implemented here is superscripted citations using the Springer Nature style (`biblatex`, with `biber` backend), where article titles follow sentence casing.
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

Be careful using the `-pvc` (preview continuous) flag in the `latexmk` settings toolchain. 
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

Then stop it with Ctrl+C in the same terminal window, properly terminating the watching process.

Cautions in `-pvc` mode

- Don't close VS Code/terminal without properly stopping the pvc process
- Don't delete output files while pvc is running (it'll keep trying to regenerate them)
- Always use Ctrl+C to stop the process, don't just close the window

If things do get stuck:

- Find and kill the `perl.exe` process in Task Manager
- Clean auxiliary files AFTER killing the process
- Start fresh with a new build
