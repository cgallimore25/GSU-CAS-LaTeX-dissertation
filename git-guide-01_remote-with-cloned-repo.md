# Command Line Guide for Cloned Remote Repository

This guide covers essential Git commands for working with repositories through the command line interface, with a focus on Windows environments.

## Initial Setup
First, navigate to your repository directory:
```bash
cd C:\Users\YourName\Documents\MATLAB\my-github-repo-main
```

## Core Commands

### 1. Status and Changes
Check the current status of your repository:
```bash
git status  # Shows modified files, staged changes, and branch info
```

View specific changes made to files:
```bash
git diff  # Shows unstaged changes in files
```

### 2. Staging Changes
Stage files for commit:
```bash
git add filename.m  # Stage a specific file
git add .          # Stage all changes in current directory
```

### 3. Committing Changes
Commit your staged changes:
```bash
git commit -m "Brief description of changes"
```

### 4. Remote Operations
Push your changes to GitHub:
```bash
git push origin main  # 'origin' is remote, 'main' is branch name
```

## Typical Workflow Example

1. Before starting work, get latest changes:
```bash
git pull  # Get latest changes from remote repository
```

2. Make your changes to files in MATLAB

3. Review your changes:
```bash
git status
git diff
```

4. Stage and commit changes:
```bash
git add .
git commit -m "Added new function for signal processing"
```

5. Push to GitHub:
```bash
git push origin main
```

## Additional Useful Commands

### Branch Management
```bash
git branch                  # List branches
git checkout -b new-branch  # Create and switch to new branch
```

### History and Recovery
```bash
git log                    # View commit history
git restore filename.m     # Discard changes in a file
```

---
*Note: Replace 'filename.m' with your actual file names, and adjust paths according to your system configuration.*
