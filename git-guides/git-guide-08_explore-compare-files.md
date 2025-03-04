# Git Exploration and Comparison Guide

## 1. Directory Structure Commands

### Basic Directory Listing
```bash
# Standard directory listing
ls

# Detailed listing with permissions
ls -l

# All files (including hidden), in long format
ls -la
```

#### Detailed Flags Breakdown
| Flag | Meaning |
|------|---------|
| `-l` | Long format (detailed view) |
| `-a` | Show all files (including hidden) |
| `-h` | Human-readable file sizes |

### Git-Specific Directory Exploration
```bash
# List tracked files in the repository
git ls-files

# Show all files tracked and their status
git ls-files -s

# List untracked files
git ls-files --others
```

## 2. Branch Exploration and Visualization

### Basic Branch Listing
```bash
# List local branches
git branch

# List all branches (local and remote)
git branch -a

# Verbose listing with last commit
git branch -vv
```

### Log Visualization Commands
```bash
# Basic commit log
git log

# Compact one-line log
git log --oneline

# Graphical branch representation
git log --graph --oneline --all

# Detailed graph with branches
git log --graph --decorate --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short
```

### Advanced Log Formatting
```bash
# Custom log format
git log --pretty=format:"%h - %an, %ar : %s"

# Limit number of commits
git log -n 3

# Show commits by specific author
git log --author="YourName"

# Show commits in a date range
git log --since="2 weeks ago"
```

## 3. Difference Commands

### Comparing Working Directory
```bash
# Show changes not yet staged
git diff

# Show staged changes
git diff --staged

# Compare specific file
git diff path/to/file
```

### Comparing Branches
```bash
# Compare current branch with main
git diff main

# Compare specific files between branches
git diff main:path/to/file feature-branch:path/to/file

# List files different between branches
git diff --name-only main feature-branch
```

### Comparing Commits
```bash
# Diff between last two commits
git diff HEAD~1 HEAD

# Show what changed in a specific commit
git show commit-hash

# Detailed diff of a commit
git show --name-only commit-hash
```

## Combining Commands for Powerful Exploration

### Comprehensive Branch and Commit Overview
```bash
# Show all branches with last commit
git branch -vv

# Graphical log of all branches
git log --graph --oneline --all

# Detailed branch status
git branch -vva
```

### Tracking Changes Across Repository
```bash
# Show all changed files
git status

# List modified files
git ls-files --modified

# Diff of all modified files
git diff --name-only
```

## Pro Tips

1. **Always use `git status` before committing to understand your current state**
2. **Use `-p` flag with many commands for more detailed output**
3. **Combine flags to create powerful, custom views**

### Useful Aliases You Might Want to Set Up
```bash
# In your .gitconfig or bash profile
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```

---
*Note: Replace placeholders like `YourName` and `path/to/file` with your actual values.*
