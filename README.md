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
3. It employs a user-friendly, highly customizable text editor (VS Code) with great VC integration and text auto-completion functionalities (often lacking in default LaTeX editors).

Version controlling with Git is by no means required, but is recommended for documents of this size, offering invaluable features such as `branching`.

## Features

Using modern integrated development environments (IDEs) comes with a great number of perks.
One of the most useful features of writing LaTeX in VS Code (or other editors like Vim) is the ability to create code "snippets", which allow templating and tab-completion to abstract away and speed up inputting tedious syntax.
Several examples come shipped with this repository by me (and by LaTeX Workshop), though these can be built out much further for any type of commonly used environment (itemized lists, equations, etc) you often use.

Other features built into this repository:

1. Standalone section compilation with the `subfiles` package
2. Optimized compilation and file auto-cleaning with `latexmk`
3. Forward and reverse `synctex` compatible with multi-file structure, allowing quick transitions from source code to pdf and back
4. Tab completion of filenames and many core package commands (also customizable)
5. A comprehensive set of `git-guides` for learning how to use version control with your writing project

## Installation

The steps to set-up this workflow have migrated over to the repository [Wiki](https://github.com/cgallimore25/GSU-CAS-LaTeX-dissertation/wiki)!

## Contributing

In addition to the modularization and package updates that I've included here, there are likely many more ways that this template could be further improved.
I'd love to incorporate user modifications which make this better, so please feel free to start a Discussion, or open an Issue or Pull Request from the tabs at the top of the GitHub home page.
