# Commit Revert and Reset Guide

This is a markdown reproduction combining several excellent StackOverflow[^1][^2][^3] answers

### Q: How do I revert a Git repository to a previous commit?[^1]

## Answer:

## Temporarily switch to a different commit

If you want to temporarily go back to it, fool around, then come back to where you are, all you have to do is checkout the desired commit:

```bash
# This will detach your HEAD, that is, leave you with no branch checked out:
git checkout 0d1d7fc32   # this is your commit SHA number
```

Or if you want to make commits while you're there, go ahead and make a new branch while you're at it:

```bash
git checkout -b old-state 0d1d7fc32
```

To go back to where you were, just check out the branch you were on again. (If you've made changes, as always when switching branches, you'll have to deal with them as appropriate. 
You could `reset` to throw them away; you could `stash`, `checkout`, `stash pop` to take them with you; you could commit them to a branch there if you want a branch there.)

## Hard delete unpublished commits

If, on the other hand, you want to really get rid of everything you've done since then, there are two possibilities. 
One, if you haven't published any of these commits, simply reset:

```bash
# This will destroy any local modifications.
# Don't do it if you have uncommitted work you want to keep.
git reset --hard 0d1d7fc32

# Alternatively, if there's work to keep:
git stash
git reset --hard 0d1d7fc32
git stash pop
# This saves the modifications, then reapplies that patch after resetting.
# You could get merge conflicts, if you've modified things which were
# changed since the commit you reset to.
```

**NOTE** This will also work for published commits that have been pushed to remote, ***but*** it will prevent you from being able to `commit` and `push` in the usual way afterward[^2]. 
This is because you have effectively gone backwards in time, and will need to force push `git push -f`, which is ***inadvisable if you are collaborating with others***[^3]. 
On a project maintained by a sole author, this is okay.
If you want to avoid this entirely, see `revert` below.

## Undo published commits with new commits

On the other hand, if you've published the work, you probably don't want to `reset` the branch, since that's effectively rewriting history. In that case, you could indeed `revert` the commits. In many enterprise organisations, the concept of "protected" branches will even prevent history from being rewritten on some major branches. In this case, reverting is your only option.

With Git, `revert` has a very specific meaning: create a commit with the reverse patch to cancel it out. This way you don't rewrite any history.

First figure out what commits to `revert`. Depending on the technique chosen below, you want to either `revert` only the merge commits, or only the non-merge commits.

```bash
# This lists all merge commits between 0d1d7fc and HEAD:
git log --merges --pretty=format:"%h" 0d1d7fc..HEAD | tr '\n' ' '

# This lists all non merge commits between 0d1d7fc and HEAD:
git log --no-merges --pretty=format:"%h" 0d1d7fc..HEAD | tr '\n' ' '
```

Note: if you `revert` multiple commits, the order matters. Start with the most recent commit.

```bash
# This will create three separate revert commits, use non merge commits only:
git revert a867b4af 25eee4ca 0766c053

# It also takes ranges. This will revert the last two commits:
git revert HEAD~2..HEAD

# Similarly, you can revert a range of commits using commit hashes (non inclusive of first hash):
git revert 0d1d7fc..a867b4a

# Reverting a merge commit. You can also use a range of merge commits here.
git revert -m 1 <merge_commit_sha>

# To get just one, you could use `rebase -i` to squash them afterwards
# Or, you could do it manually (be sure to do this at top level of the repo)
# get your index and work tree into the desired state, without changing HEAD:
git checkout 0d1d7fc32 .

# Then commit. Be sure and write a good message describing what you just did
git commit
```

## References

[^1]: [How do I revert a Git repository to a previous commit?](https://stackoverflow.com/questions/4114095/how-do-i-revert-a-git-repository-to-a-previous-commit)
[^2]: [git revert back to certain commit [duplicate]](https://stackoverflow.com/questions/6794110/git-revert-back-to-certain-commit)
[^3]: [Commit and push changes after going back to a particular revision in the repository?](https://stackoverflow.com/questions/38229852/commit-and-push-changes-after-going-back-to-a-particular-revision-in-the-reposit)