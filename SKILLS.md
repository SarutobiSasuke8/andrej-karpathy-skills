# Skills

A catalog of behavioral skills for improving LLM-assisted coding. Each skill is a focused set of guidelines you can add to `CLAUDE.md`, a Cursor rule, or any other LLM instruction file.

## Available Skills

| Skill | Description |
|-------|-------------|
| [karpathy-guidelines](./skills/karpathy-guidelines/SKILL.md) | Behavioral guidelines to reduce common LLM coding mistakes — the four core principles: Think Before Coding, Simplicity First, Surgical Changes, Goal-Driven Execution. |
| [testing-first](./skills/testing-first/SKILL.md) | Write a failing test before fixing bugs or adding features. Ensures changes are verifiable and regressions are caught. |
| [pr-hygiene](./skills/pr-hygiene/SKILL.md) | Keep pull requests small, focused, and easy to review. One concern per PR, commit messages that explain why, clean diffs. |
| [api-design](./skills/api-design/SKILL.md) | Design stable, minimal, unsurprising APIs. Expose behavior not implementation, design for the call site, extend don't mutate. |
| [security-defaults](./skills/security-defaults/SKILL.md) | Apply secure defaults by default — validate at the boundary, no secrets in code, least privilege, encode for the sink. |

## Usage

**Claude Code Plugin:**
```
/plugin marketplace add forrestchang/andrej-karpathy-skills
/plugin install andrej-karpathy-skills@<skill-name>
```

**CLAUDE.md (per-project):**
```bash
curl https://raw.githubusercontent.com/forrestchang/andrej-karpathy-skills/main/skills/<skill-name>/SKILL.md >> CLAUDE.md
```

**Combine multiple skills:**
```bash
for skill in karpathy-guidelines testing-first pr-hygiene; do
  echo "" >> CLAUDE.md
  curl https://raw.githubusercontent.com/forrestchang/andrej-karpathy-skills/main/skills/$skill/SKILL.md >> CLAUDE.md
done
```
