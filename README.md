# agent_skills

John's personal skills for Claude Code and Codex. Each directory under `skills/` is one skill: a `SKILL.md` with `name` and `description` frontmatter, plus any files it needs.

| Skill | Does |
|---|---|
| `plainly` | Rewrites the last reply, a file's comments, a commit message, an issue, or a document in plain language, ISO 24495-1. |
| `new-python-project` | Scaffolds a Python project: uv with the uv_build backend, ruff and complexipy configured in `pyproject.toml`, a justfile `check` recipe, and prek hooks that lint on every commit. |

## Install

    just install

This links each skill into `~/.claude/skills/<name>` for Claude Code and `~/.agents/skills/<name>` for Codex. Both hosts follow the links, so an edit here applies at once. Claude Code invokes a skill as `/<name>` and Codex as `$<name>`. Run `just install` again after adding a skill.

## Adding a skill

1. Create `skills/<name>/SKILL.md`. The frontmatter `name` must equal the directory name.
2. If the skill runs only when asked for by name, set `disable-model-invocation: true` in the frontmatter and add `agents/openai.yaml` with `policy.allow_implicit_invocation: false`. The first is Claude Code's rule, the second is Codex's.
3. `just check`, then `just install`.

## Check

    just check

Runs shellcheck over `bin/` and `bin/check-skills`, which checks each skill's frontmatter, its line count, and that an explicit-only skill carries the rule for both hosts.
