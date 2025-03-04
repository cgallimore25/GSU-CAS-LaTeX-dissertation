# Deleting Git Tags: Local and Remote

This is a markdown reproduction of this StackOverflow[^1] answer for educational purposes. 

### Q: How can I delete a Git tag that has already been pushed?[^1] 

## Answer:

You can push an 'empty' reference to the remote tag name (concise):
```bash
git push origin :tagname
```

Or, more expressively, use the `--delete` option (explicit; recommended)):
```bash
# For Git versions 1.8.0+
git push --delete origin tagname

# For older Git versions
git push -d origin tagname
```

Note that git has tag namespace and branch namespace so you may use the same name for a branch and for a tag. If you want to make sure that you cannot accidentally remove the branch instead of the tag, you can specify full ref which will never delete a branch:
```bash
git push origin :refs/tags/tagname
```

If you also need to delete the local tag, use:
```bash
git tag --delete tagname
```

## Background
Pushing a branch, tag, or other ref to a remote repository involves specifying "which repo, what source, what destination?"
```bash
git push remote-repo source-ref:destination-ref
```

A real world example where you push your master branch to the origin's master branch is:
```bash
git push origin refs/heads/master:refs/heads/master
```

Which because of default paths, can be shortened to:
```bash
git push origin master:master
```

Tags work the same way:
```bash
git push origin refs/tags/release-1.0:refs/tags/release-1.0
```
Which can also be shortened to:
```bash
git push origin release-1.0:release-1.0
```
By omitting the source ref (the part before the colon), you push 'nothing' to the destination, deleting the ref on the remote end.


### Examples of Full Reference Pushing
1. Pushing a branch:
```bash
# Full reference
git push origin refs/heads/master:refs/heads/master

# Shorthand
git push origin master:master
```

2. Pushing a tag:
```bash
# Full reference
git push origin refs/tags/release-1.0:refs/tags/release-1.0

# Shorthand
git push origin release-1.0:release-1.0
```

### The 'Empty' Reference Trick
- By omitting the source ref (part before the colon), you push 'nothing'
- This effectively deletes the ref on the remote

## Best Practices
1. Always verify the tag name before deletion
2. Use full references to prevent accidental deletions
3. Delete both local and remote tags for complete removal

## Workflow Example
```bash
# Delete local tag
git tag --delete v1.0

# Delete remote tag
git push origin :refs/tags/v1.0
```

## References

[^1]: [How can I delete a remote tag?](https://stackoverflow.com/questions/5480258/how-can-i-delete-a-remote-tag)