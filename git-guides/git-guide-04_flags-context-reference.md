# Common Git Flags and Options Reference

## Branch Operations
| Flag | Command Context | Description | Example |
|------|----------------|-------------|---------|
| `-b` | `checkout`, `switch` | Creates and switches to a new branch | `git checkout -b feature` |
| `-B` | `checkout` | Creates/resets branch to start at current commit | `git checkout -B feature` |
| `-d` | `branch` | Deletes a branch (safely) | `git branch -d old-feature` |
| `-D` | `branch` | Forces branch deletion | `git branch -D broken-feature` |
| `-m` | `branch` | Renames a branch | `git branch -m new-name` |
| `-M` | `branch` | Forces branch rename | `git branch -M main` |
| `-c` | `switch` | Creates and switches to a new branch (newer syntax) | `git switch -c feature` |
| `-r` | `branch` | Lists remote branches | `git branch -r` |
| `-a` | `branch` | Lists all branches (local and remote) | `git branch -a` |

## Remote Operations
| Flag | Command Context | Description | Example |
|------|----------------|-------------|---------|
| `-u` | `push` | Sets up tracking between local and remote branches | `git push -u origin main` |
| `-v` | `remote` | Shows verbose output (URLs) | `git remote -v` |
| `-f` | `push`, `pull` | Forces the operation | `git push -f origin main` |
| `--set-upstream` | `push` | Long form of `-u` | `git push --set-upstream origin feature` |

## Adding and Committing
| Flag | Command Context | Description | Example |
|------|----------------|-------------|---------|
| `-A` | `add` | Stages all changes (including untracked) | `git add -A` |
| `-p` | `add` | Interactive staging of parts of files | `git add -p` |
| `-m` | `commit` | Specifies commit message | `git commit -m "Fix bug"` |
| `-a` | `commit` | Stages modified files and commits | `git commit -a -m "Quick fix"` |
| `--amend` | `commit` | Modifies the last commit | `git commit --amend` |

## Status and Diff
| Flag | Command Context | Description | Example |
|------|----------------|-------------|---------|
| `-s` | `status` | Shows status in short format | `git status -s` |
| `-b` | `status` | Shows branch info | `git status -b` |
| `--staged` | `diff` | Shows staged changes | `git diff --staged` |
| `--name-only` | `diff` | Shows only names of changed files | `git diff --name-only` |

## Pulling and Fetching
| Flag | Command Context | Description | Example |
|------|----------------|-------------|---------|
| `--rebase` | `pull` | Pulls using rebase instead of merge | `git pull --rebase origin main` |
| `-p` | `fetch` | Prunes deleted remote branches | `git fetch -p` |
| `--all` | `fetch` | Fetches from all remotes | `git fetch --all` |

## Stashing
| Flag | Command Context | Description | Example |
|------|----------------|-------------|---------|
| `-u` | `stash` | Includes untracked files | `git stash -u` |
| `--keep-index` | `stash` | Stashes but keeps staging area | `git stash --keep-index` |
| `-p` | `stash` | Interactive stashing | `git stash -p` |

## Log and History
| Flag | Command Context | Description | Example |
|------|----------------|-------------|---------|
| `--oneline` | `log` | Compact log format | `git log --oneline` |
| `--graph` | `log` | Shows ASCII graph of branches | `git log --graph` |
| `-p` | `log` | Shows patches (changes) | `git log -p` |
| `-n` | `log` | Limits number of commits shown | `git log -n 5` |

## Configuration
| Flag | Command Context | Description | Example |
|------|----------------|-------------|---------|
| `--global` | `config` | Sets config for all repositories | `git config --global user.name "Name"` |
| `--local` | `config` | Sets config for current repository | `git config --local user.email "email"` |
| `--list` | `config` | Lists all configurations | `git config --list` |

## Common Combined Flags
| Combined Flags | Command | Description | Example |
|---------------|---------|-------------|---------|
| `-am` | `commit` | Stages modified files and commits with message | `git commit -am "Quick update"` |
| `-avv` | `branch` | Lists branches with last commit and upstream info | `git branch -avv` |

---
*Note: This is not an exhaustive list but covers the most commonly used flags. Many commands have additional options available in their documentation (`git help <command>`).*
