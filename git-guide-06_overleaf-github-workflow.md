# Hybrid Overleaf-GitHub Workflow Guide

This guide explains how to maintain a LaTeX project using both Overleaf and GitHub, with Git as the coordination layer. This workflow allows you to use Overleaf's rich editing environment while maintaining sophisticated version control through GitHub.

## Initial Setup

```bash
# 1. First create a GitHub repository and clone it locally
git clone https://github.com/your-username/your-thesis.git
cd your-thesis

# 2. Add Overleaf as a remote
git remote add overleaf https://git.overleaf.com/your-project-id

# 3. Create initial branch structure
# The -b flag creates a new branch
git checkout -b sections2+3
git checkout -b abstract+intro
git checkout -b discussion

# 4. First-time push of each branch to GitHub
# The -u flag sets up tracking (only needed once per branch)
git push -u origin sections2+3
git push -u origin abstract+intro
git push -u origin discussion
```

## Regular Workflow Commands

### Starting Work on a Section

```bash
# Switch to the branch you want to work on
git checkout sections2+3

# Push this branch to Overleaf's master branch
# The colon syntax means "push local branch to remote branch"
git push -f overleaf sections2+3:master
```

### Saving Work from Overleaf

```bash
# Make sure you're on the right branch
git checkout sections2+3

# Pull changes from Overleaf's master to your local branch
git pull overleaf master

# Push to GitHub to preserve branch history
# No -u needed after first push
git push origin sections2+3
```

### Switching to Work on a Different Section

```bash
# 1. First save current work from Overleaf
git checkout sections2+3
git pull overleaf master
git push origin sections2+3

# 2. Switch to new section
git checkout abstract+intro

# 3. Push new content to Overleaf
# -f forces the push, overwriting Overleaf's master
git push -f overleaf abstract+intro:master
```

### Managing the Main Branch

```bash
# When ready to merge changes into main
git checkout main
git merge sections2+3
git push origin main

# If you want the main version in Overleaf
# Note: Overleaf still uses 'master' even though GitHub uses 'main'
git push overleaf main:master
```

## Important Concepts

### The `-u` Flag
- Used with `git push -u origin branch-name`
- Only needed for the first push of a new branch
- Sets up tracking between local and remote branches
- After using -u once, you can just use `git push`

### The Colon Syntax
- Format: `git push remote local-branch:remote-branch`
- Example: `git push overleaf abstract+intro:master`
- Means "push my local branch to this differently-named remote branch"
- Useful because Overleaf only has a master branch

### The `-f` Flag and Branch Overwriting
- Forces the push, overwriting the remote branch completely
- In this workflow, we use it to "swap" what's displayed in Overleaf
- Different from a merge:
  - Merge: combines changes from both branches
  - Force push: replaces remote content entirely with local content
- Safe to use with Overleaf's master because we maintain history in GitHub
- Use with extreme caution on GitHub branches as it rewrites remote history

## Best Practices

1. **Always Save Before Switching**
   - Pull from Overleaf before switching branches
   - Push to GitHub to preserve history

2. **Keep Clean Branches**
   - Use descriptive branch names
   - Delete branches after merging if no longer needed
   - Keep main as your "publication ready" version

3. **Use Tags for Important Versions**
```bash
# Create an annotated tag
git tag -a v1.0 -m "Initial submission version"
# Push tags to GitHub
git push origin v1.0
```

4. **Regular Backups**
   - Push to GitHub frequently
   - Consider automated backup solutions

## Understanding the Two Remotes

1. **GitHub (origin)**
   - Maintains your complete branch structure
   - Uses 'main' as the default branch
   - Preserves full history of all branches
   - Your primary backup and version control system

2. **Overleaf (overleaf)**
   - Only has a single 'master' branch
   - Acts like a "display window" for editing
   - Gets overwritten when switching branches
   - Temporary working space, not version storage

## Troubleshooting

If you get merge conflicts:
```bash
# 1. Fix conflicts in the files
# 2. Mark as resolved
git add .
# 3. Complete the merge
git commit -m "Resolved merge conflicts"
```

If you need to undo an Overleaf push:
```bash
# Return to previous version
git checkout previous-branch
git push -f overleaf previous-branch:master
```
