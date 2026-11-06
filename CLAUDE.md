# agent_skills

Personal skills that load in both Claude Code and Codex. The prerequisites, and how to install and add skills, are in README.md.

## Check

    just check

## Rules

- Both hosts use the same `SKILL.md` for a skill. Write host-specific steps as "in Claude Code, X; in Codex, Y" inside the procedure, the way [johns-way](https://github.com/johnoshea/johns-way) does.
- Each `SKILL.md` is under 60 lines. Files beside it are loaded on demand and are outside the budget.
- Use `disable-model-invocation: true` in the frontmatter together with `allow_implicit_invocation: false` in `agents/openai.yaml`. The check enforces the pair.
- Write for a reader who was not in the session: the rule, never the story of how we arrived at it.
- The installed links point at this checkout, so edits are live at once. Codex loads a new skill only in a new thread.
