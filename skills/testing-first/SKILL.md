---
name: testing-first
description: Write a failing test before fixing bugs or adding features. Use when debugging, implementing new behavior, or refactoring to ensure changes are verifiable and regressions are caught.
license: MIT
---

# Testing First

Write the test before the fix. A test that reproduces the problem is proof you understood it; a test that passes afterward is proof you solved it.

**Tradeoff:** Adds upfront time. Worth it for non-trivial bugs and new behavior. Skip for obvious one-liners.

## 1. Reproduce Before Fixing

**Don't touch the code until you have a failing test.**

- Write a test that fails for the exact reason described in the bug report.
- If you can't write a failing test, you don't understand the bug yet.
- Run the test to confirm it fails before changing anything.
- Then make the minimal change that makes it pass.

```
1. Write test → verify: it fails
2. Fix the code → verify: test passes
3. Run full suite → verify: no regressions
```

## 2. One Test Per Behavior

**Each test asserts one thing. Name it precisely.**

- Test name should complete the sentence: "It should..."
- One assertion per test where practical. Multiple assertions are fine if they're all part of the same behavior.
- Don't test implementation details — test observable behavior.
- If a test breaks when you rename a variable, it's testing the wrong thing.

## 3. Tests Live With the Code They Test

**Colocation reduces drift.**

- Keep tests in the same directory as the code they cover, or in a parallel mirror structure.
- When you move a file, move its tests.
- When you delete a file, delete its tests.
- Orphaned tests are lies — remove them.

## 4. Don't Write Tests for Tests

**No over-specified fixtures, no test utilities that need their own tests.**

- Prefer simple inline setup over shared fixtures for non-trivial state.
- If your test helper is longer than the test, collapse it inline.
- Avoid mocking what you don't own — use the real thing where fast enough.
- A slow, real test is better than a fast test of a mock.
