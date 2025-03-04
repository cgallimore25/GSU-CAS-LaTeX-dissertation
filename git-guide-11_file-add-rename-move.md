# Git Guide: Adding, Moving, Removing, and Renaming Files

## Adding Files to Staging

The below commands detail some common ways to add files to the stage for commit.

### Basic Add Commands

```bash
# Add all files in current directory and subdirectories
git add .

# Add specific file
git add filename.txt

# Add specific directory and its contents
git add dir_name/

# Add multiple specific files
git add file1.txt file2.txt

# Add all files of specific type
git add *.py
```

### Advanced Add Commands

```bash
# Add all files from root of repository 
# (regardless of current directory)
git add :/

# Add files interactively (choose chunks to stage)
git add -p filename.txt

# Add all modified and deleted files (skip untracked)
git add -u

# Add all content under directory, except ignored files
git add dir_name/*
```

## Moving, Renaming, and Removing Files

Properly moving, renaming, and removing files and folders isn't as simple as clicking and dragging in your computer's file explorer.
In a sense, you're changing up the address on `git`.

If you move a file using your Windows explorer/Mac OS finder, the:

1. Original file appears as ***deleted***
2. New file appears as ***untracked*** in a new location
3. File history is not automatically connected

Consequently, you have to `git add` the new file location, then `git rm` (remove) the old location.[^1]
Though this may cause a disconnect in your file history.
Consider the implications:

```bash
# After manual move/rename:
git log newname.txt  # Only shows history since the move
git log oldname.txt  # Shows old history but appears disconnected
```

The `git mv` command packages both of these steps into one operation, and will preserve the history in addition to staging the changes automatically:

```bash
# With git mv:
git log newname.txt  # Shows complete history
```

### Basic Move Commands

```bash
# Move file into subdirectory
git mv file.txt subdirectory/

# Move file up to parent directory
git mv subdirectory/file.txt ./

# Rename file 
git mv oldname.txt newname.txt

# Move multiple files into directory
git mv file1.txt file2.txt target_directory/

# Move all .txt files into directory
git mv *.txt target_directory/

# Move all of multiple file types
git mv *.sty *.cls target_directory/
```

Notice in the Rename example that renaming *is* part of moving a file, you're just assigning it a new name.

### Advanced Move Examples

```bash
# Move and rename in one command
git mv old_dir/old_name.txt new_dir/new_name.txt

# Move entire directory
git mv source_dir target_dir/

# Move contents of directory up one level
git mv directory/* ./
```

### Removing Files

Similar to the above, simply deleting a file in your computer's file explorer the usual way will cause it to remain in the `git` history, appearing as ***deleted***, but not staged.
This deletion must then be committed as a change, which has some benefits – it can, for example, be revived by reverting this commit.

Using `git rm` however will remove files from your `git` repo's whole repository and its history, as if it never existed.

```bash
git rm unwanted-file.txt
```

For entire directory removal, you need the `-r` flag for 'recursive'.

Try either of these commands:

```bash
git rm -r dir-to-delete/*
```

or

```bash
git rm -r dir-to-delete/
```

## Common Patterns and Tips

### Moving Files Up a Directory

```bash
# From inside the subdirectory:
git mv * ../

# From parent directory:
git mv subdirectory/* ./
```

### Moving Files Down to New Directory

```bash
# Create directory and move in one go
mkdir new_dir && git mv *.txt new_dir/

# Move specific file types
git mv *.py src/
git mv *.css styles/
```

### Smart Add Combinations

```bash
# Add all Python files, recursively
git add "**/*.py"

# Add all files in 'src' except tests
git add src/
git reset src/tests/

# Add new files and modifications, exclude deletions
git add . --ignore-removal
```

## Important Notes

1. `git add .`
   - Adds everything under current directory
   - Includes subdirectories
   - Includes new, modified, and deleted files

2. `git add -u`
   - Only adds modified and deleted files
   - Ignores untracked (new) files
   - Useful for excluding new files

3. `git mv`
   - Automatically stages the move
   - Preserves file history
   - Better than manual move + add

4. Moving Multiple Files
   - Wildcards work: `git mv *.txt target_dir/`
   - Can combine with mkdir: `mkdir -p new_dir && git mv file.txt new_dir/`
   - Can move entire directories: `git mv old_dir/* new_dir/`

## Best Practices

1. Always verify moves with `git status` before committing
2. Use `git mv` instead of regular file system moves
3. It's recommended to make renames and moves an individual commit, separate from modification of the file
4. Create target directories before moving files
5. Be careful with wildcards to avoid unintended moves
6. Consider using `-n` (dry run) for complex move operations

---
*Note: Replace filenames and directory names with your actual file and directory names.*

## Further reading

For a much more detailed explanation of how git handles files in a system, checkout this Stack Overflow answer[^2]

## References

[^1]: [Move Files Using Git mv Or Use File System Instead](https://softwareengineering.stackexchange.com/questions/279477/move-files-using-git-mv-or-use-file-system-instead)
[^2]: [How does git handle moving files in the file system?](https://stackoverflow.com/questions/21082342/how-does-git-handle-moving-files-in-the-file-system)
