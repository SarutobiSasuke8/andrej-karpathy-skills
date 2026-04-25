---
name: pr-hygiene
description: Keep pull requests small, focused, and easy to review. Use when preparing commits and PRs to reduce review friction, avoid merge conflicts, and maintain a clean git history.
license: MIT
---

# PR Hygiene

A PR is a unit of review, not a unit of work. Optimize for the reviewer, not the author.

**Tradeoff:** Splitting work takes discipline. The payoff is faster reviews, cleaner history, and easier reverts.

## 1. One Concern Per PR

**If you can't summarize the PR in one sentence, split it.**

- A PR that fixes a bug should not also refactor the surrounding code.
- A PR that adds a feature should not also fix unrelated lint errors.
- Refactors and behavior changes must be separate PRs — always.
- If you find a bug while working on a feature, fix it in a separate branch first.

The test: Could a reviewer approve either half independently? If yes, it should be two PRs.

## 2. Commit Messages Explain Why

**The diff shows what changed. The message explains why.**

- First line: imperative mood, under 72 characters. ("Add rate limiting to /auth endpoint")
- If the why needs more than one line, add a blank line then a short paragraph.
- Don't describe the diff ("Changed X from Y to Z") — the diff already does that.
- Reference issue numbers when relevant, but don't rely on them for context.

Bad: `fix stuff`
Bad: `changed the timeout from 30 to 60 in the config`
Good: `Increase auth timeout to handle slow LDAP responses`

## 3. Keep PRs Reviewable

**Target under 400 lines changed. Hard limit at 800.**

- Large PRs get rubber-stamped. Small PRs get real feedback.
- If a PR must be large, add a description explaining the structure — what to read first, what's mechanical vs. meaningful.
- Don't pad a PR with auto-generated files or vendored code without flagging it.
- Squash fixup commits before requesting review. History like "fix", "fix fix", "typo" wastes reviewers' time.

## 4. Clean Up Before Review

**Review your own diff before requesting others' time.**

- Read the diff top to bottom as if you're the reviewer.
- Remove debug logging, commented-out code, and TODO comments that belong in issues.
- Verify the PR description matches what's actually in the diff.
- Check that CI passes locally before pushing for review.
