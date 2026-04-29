# Contributing

## Adding a New Skill

A skill is a short, focused set of behavioral guidelines for a specific area of software development. Before writing one, check that it doesn't overlap significantly with an existing skill.

### Checklist

- [ ] The skill addresses a real, recurring failure mode in LLM-assisted coding
- [ ] The skill is specific enough to be actionable, not aspirational ("write clean code" is not a skill)
- [ ] The skill fits in under 80 lines
- [ ] Each principle has a concrete test or heuristic — something Claude can actually apply
- [ ] The skill has been tested: did it change Claude's behavior in the way you expected?

### File structure

```
skills/
  your-skill-name/
    SKILL.md       # English (required)
    SKILL.zh.md    # Chinese translation (optional but appreciated)
```

### SKILL.md format

```markdown
---
name: your-skill-name
description: One sentence. What the skill does and when to use it.
license: MIT
---

# Skill Title

One paragraph. The core problem this skill solves and the main tradeoff.

## 1. Principle Name

**One-line summary in bold.**

- Specific, actionable bullet
- Another bullet
- The test: how to know you're applying this correctly
```

Keep the frontmatter `description` under 200 characters — it shows in the plugin marketplace and skill catalog.

### Submitting

1. Fork the repo and create a branch: `skill/your-skill-name`
2. Add your `SKILL.md` (and optionally `SKILL.zh.md`)
3. Add a row to the table in `SKILLS.md`
4. Open a PR with a brief description of the failure mode the skill addresses and how you tested it

## Improving an Existing Skill

Fix typos, sharpen wording, or add a missing heuristic via a PR. Keep changes surgical — match the existing voice and don't expand scope.

## Reporting a Problem

Use the [skill problem issue template](.github/ISSUE_TEMPLATE/skill-problem.md) to report guidelines that cause incorrect or unhelpful behavior.
