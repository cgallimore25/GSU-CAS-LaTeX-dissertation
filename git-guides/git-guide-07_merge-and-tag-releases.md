
# Merging and Tagging New Releases 

This guide provides step-by-step instructions for merging the `developments` branch into `main`, tagging the release as version 2.0.0, and pushing it to your remote repository.

---

## 1. Merge `developments` into `main` Locally
1. Ensure you're on the `main` branch and it's up to date:
   ```bash
   git checkout main
   git pull origin main
   ```

2. Merge the `developments` branch into `main`:
   ```bash
   git merge developments
   ```

3. If there are conflicts, resolve them manually, then finalize the merge with:
   ```bash
   git add .
   git commit
   ```
   - If you use `git commit` without `-m`, your default text editor will open for you to enter a commit message.

---

## 2. Assign the Version Tag

You can assign the version tag either **before** or **after** pushing your changes to the remote `main` branch.

### Option 1: Assign the Tag Before Pushing
1. Create a tag for version 2.0.0:
   ```bash
   git tag -a v2.0.0 -m "Version 2.0.0: Major feature additions and logic refactoring"
   ```

2. Push the `main` branch and the tag together:
   ```bash
   git push origin main --tags
   ```

### Option 2: Assign the Tag After Pushing
1. Push your changes to the `main` branch first:
   ```bash
   git push origin main
   ```

2. Create a tag for version 2.0.0:
   ```bash
   git tag -a v2.0.0 -m "Version 2.0.0: Major feature additions and logic refactoring"
   ```

3. Push the tag to the remote:
   ```bash
   git push origin v2.0.0
   ```

---

## 3. Publish a Release on GitHub
1. Navigate to your repository on GitHub.
2. Go to the **Releases** section.
3. Click **Draft a new release**.
4. Select the tag `v2.0.0` and give the release a title (e.g., "Version 2.0.0").
5. Provide a detailed description of the new features, refactors, and any breaking changes.
6. Click **Publish Release**.

---

## Notes
- Use `git log` to confirm your commits and tags are applied correctly.
- Use `git tag` to list all tags in your repository.
