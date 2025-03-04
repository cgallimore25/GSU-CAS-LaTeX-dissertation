# Git Branching Operations Guide

## Basic Branch Commands and Flags

The core idea behind branching is that you take a 'snapshot' of the state of your code that allows you to diverge from the main line of work without messing with that main line, essentially creating an isolated environment for you to test changes.
The `main` branch should always have the functional, publishable, or deployment-ready state of your code, and you can use branches from `main` to keep this sacred.

### The Command Itself

With no arguments

```bash
git branch
```

lists all the *local* branches in your repository.
This distinction between *local* and *remote* will become quite important going forward.

```bash
git branch -a
```

will ensure your *remote* branches are also included in this list.

List all available remotes specifically

```bash
git branch -r
```

### Creating and Switching Branches

The most common command for creating a new branch on your local machine is:

```bash
git checkout -b feature-branch
```

or alternatively,

```bash
git checkout -b feature-branch main
```

when specifying creation of the branch from `main`.
Note that you can also substitute `main` for another branch.

This single command does two operations:

1. Creates a new branch named "feature-branch"
2. Switches to that branch immediately

It's equivalent to running these two commands:

```bash
git branch feature-branch    # Creates the branch
git checkout feature-branch  # Switches to the branch
```

Thus, the first argument after `git branch` that is not a flag (e.g. `-a`) is `your-branch-name`

### Modern Alternative: The `switch` Command

Newer versions of Git provide the `switch` command as a clearer alternative:

```bash
git switch -c feature-branch   # -c flag creates new branch
```

### Branch Management Flags

- `-d` (Safe Delete):

  ```bash
  git branch -d old-branch  # Deletes only if changes are merged
  ```

- `-D` (Force Delete):

  ```bash
  git branch -D abandoned-branch  # Deletes even if not merged
  ```

- `-m` (Rename):

  ```bash
  git branch -m new-name  # Renames current branch
  ```

- `-M` (Force Rename):

  ```bash
  git branch -M main  # Forces rename even if target exists
  ```

## Complete Branch Workflow Examples

### Local Development Workflow

```bash
# 1. Create and switch to a feature branch
git checkout -b new-feature

# 2. Do work and commit changes
# (make changes to files)
git add .
git commit -m "Added new feature"

# 3. Switch back to main branch
git checkout main

# 4. Get any recent updates from main
git pull origin main

# 5. Merge your feature branch into main
git merge new-feature

# 6. After successful merge, delete the feature branch (optional)
git branch -d new-feature
```

### Synchronizing Local and Remotes Across 2 Machines

I like to keep my remote repository on [GitHub](https://github.com/) open whenever I'm developing code.
This allows me to compare all of the branches that *remote* has with what's available *locally*.
I'm often developing across 2 machines (my office desktop and my laptop), and it's important to keep in mind that branches I create on one computer arent immediately accessible to the other computer, even after pulling the most up-to-date code from remote.

Consider this scenario: When working on my office desktop, I decide I want to create a new branch `dev` for code developments.
I make some changes, and push to remote using the following

```bash
# 1. Create and switch to development branch
git checkout -b dev

# 2. Do work and commit
git add .
git commit -m "Added preliminary new analysis routine"

# 3. Push feature branch to GitHub
git push -u origin dev
```

I then go home, jump on my laptop, and decide to keep working on this repository.
First step is to pull from remote:

```bash
git pull origin
```

which fetches and merges the most up-to-date state of my *remote* code with my *local* code.

One of its outputs is:

```bash
From https://github.com/myusername/my-repository
   c419748..d5a37d6  main       -> origin/main
 * [new branch]      dev        -> origin/dev
```

but when I key in

```bash
git branch -a
```

it shows

```bash
* main
  remotes/origin/HEAD -> origin/main
  remotes/origin/dev
  remotes/origin/main
```

This is because `dev` is not yet a branch that exists *locally* on my machine.
The way to create the exact same branch, with the exact same name, that tracks the *remote* branch is this handy command:

```bash
git checkout --track origin/dev
```

which displays:

```bash
branch 'dev' set up to track 'origin/dev'.
Switched to a new branch 'dev'
```

Sometimes, if you switch computers very quickly, `git` on your second machine may not know about the new remote branch yet.
In which case, `git fetch` will update your local repo with information about your remote branches.

```bash
# Do a complete fetch of all remote branches
git fetch --all

# Then checkout and track
git checkout --track origin/gg-subtree
```

For a comprehensive explanation of how this works, see this [Stack Overflow answer](https://stackoverflow.com/questions/10002239/difference-between-git-checkout-track-origin-branch-and-git-checkout-b-branch)

## Important Notes

- Always ensure your main branch is up to date before creating a new feature branch
- The `-d` flag will fail if you try to delete a branch that hasn't been merged
- Use `-D` with caution as it can delete unmerged work
- Pull Requests are recommended for team settings to facilitate code review
- Regular commits and pushes to your feature branch can serve as backups of your work

## Best Practices

1. Use descriptive branch names that indicate the purpose of changes
   - Good: `feature-user-authentication`
   - Bad: `new-stuff`

2. Regularly sync your feature branch with main to avoid major merge conflicts

   ```bash
   git checkout feature-branch
   git merge main
   ```

3. Delete branches after they're merged to keep repository clean

4. Always create a new branch for new features or fixes

---
*Note: Replace branch names (feature-branch, new-feature, etc.) with meaningful names related to your specific changes.*
