# Creating a Personal Repository from a Template

This guide explains how to create your own repository from a template while maintaining the ability to receive updates from the original template and its submodules.

## Two Approaches

### Option 1: Download and Restart (Simple but Disconnected)
- Download template as ZIP and initialize as a new repository
- **Pros**: Simple, clean start with no historical baggage
- **Cons**: Loses connection to template updates and submodule updates
- **Best for**: Projects that will heavily diverge from the template

### Option 2: Remote Management (Connected and Updatable)
- Clone the template and reconfigure remotes
- **Pros**: Can receive template updates and submodule updates
- **Cons**: Slightly more complex setup and potential merge conflicts
- **Best for**: Projects that benefit from ongoing template improvements

## Option 2: Complete Workflow

### Initial Setup

```bash
# 1. Clone the template repository with submodules
git clone --recurse-submodules https://github.com/TEMPLATE_OWNER/TEMPLATE_REPO myproject
cd myproject

# 2. Rename the original remote to "template"
git remote rename origin template

# 3. Create new repository on GitHub/GitLab/etc.

# 4. Add your new repository as "origin"
git remote add origin https://github.com/YOUR_USERNAME/YOUR_NEW_REPO

# 5. Push everything to your new repository
git push -u origin main

# 6. Configure submodules to track the original source
git submodule foreach 'git remote rename origin upstream || true'
```

### Verifying Your Setup

```bash
# Check your remotes
git remote -v
# Should show:
# origin    https://github.com/YOUR_USERNAME/YOUR_NEW_REPO (fetch)
# origin    https://github.com/YOUR_USERNAME/YOUR_NEW_REPO (push)
# template  https://github.com/TEMPLATE_OWNER/TEMPLATE_REPO (fetch)
# template  https://github.com/TEMPLATE_OWNER/TEMPLATE_REPO (push)

# Check submodule remotes
cd git-guides  # Or your submodule name
git remote -v
# Should show:
# upstream  https://github.com/SUBMODULE_OWNER/SUBMODULE_REPO (fetch)
# upstream  https://github.com/SUBMODULE_OWNER/SUBMODULE_REPO (push)
```

## Updating Your Repository

### Getting Template Updates

```bash
# 1. Make sure your work is committed
git status  # Should be clean

# 2. Fetch updates from the template
git fetch template

# 3. Review what changes are incoming
git log HEAD..template/main  # or whatever branch you're tracking

# 4. Merge template changes
git merge template/main
# Resolve any conflicts if needed

# 5. Push to your repository
git push origin main
```

### Updating Submodules

```bash
# 1. Check for submodule updates
cd git-guides  # Or your submodule name
git fetch upstream
git log HEAD..upstream/main  # See what's new

# 2. Update submodule to latest version
git checkout main  # Or the branch you want
git pull upstream main
git push origin main  # If you want to push to your fork

# 3. Return to parent repository
cd ..

# 4. Stage and commit the submodule update
git add git-guides
git commit -m "Update git-guides submodule"
git push origin main
```

### Selective Updates

If you only want specific changes from the template:

```bash
# Cherry-pick specific commits
git cherry-pick COMMIT_HASH

# Or use interactive rebase to select commits
git checkout -b template-updates template/main
git rebase -i HEAD~10  # Choose last 10 commits
# Select only commits you want
git checkout main
git merge template-updates
git branch -d template-updates
```

## Common Scenarios

### Template Structure Changed

If the template drastically changes its structure:

```bash
# Create a branch to test merging
git checkout -b test-template-update
git merge template/main
# Review changes carefully
# Merge or cherry-pick as appropriate
```

### Conflicts with Your Changes

When conflicts occur during template updates:

```bash
# During merge conflict
git status  # See conflicting files

# Option 1: Keep your changes
git checkout --ours PATH/TO/CONFLICTED/FILE

# Option 2: Take template changes
git checkout --theirs PATH/TO/CONFLICTED/FILE

# Option 3: Manually edit the file to combine changes
# Then
git add PATH/TO/CONFLICTED/FILE

# Continue merge
git merge --continue
```

### Updating Nested Submodules

If the template uses nested submodules:

```bash
# Update all submodules recursively
git submodule update --init --recursive --remote

# Commit all submodule updates
git submodule foreach 'git add -A && git commit -m "Update submodule" || true'
git add .
git commit -m "Update all submodules"
```

## Best Practices

1. **Commit local changes** before pulling template updates
2. **Create a branch** before merging template changes for safety
3. **Review incoming changes** before merging
4. **Update regularly** to avoid major divergence and difficult merges
5. **Document template-specific files** that shouldn't be modified

## Troubleshooting

### Detached HEAD in Submodules

```bash
# Fix detached HEAD in submodules
git submodule foreach 'git checkout main || git checkout master || true'
```

### Remote Already Exists

```bash
# If rename commands fail because remote already exists
git remote remove origin  # Then add it again
```

### Stuck in Merge Conflict

```bash
# Abort the merge and start over
git merge --abort
```

---
*Note: Replace placeholder values like `TEMPLATE_OWNER`, `TEMPLATE_REPO`, `YOUR_USERNAME`, etc. with your actual repository information.*
