# agent_skills

Personal skills that load in both Claude Code and Codex. README.md says how they are installed and added.

## Check

    just check

## Rules

- A skill serves both hosts from one `SKILL.md`. Write host-specific steps as "in Claude Code, X; in Codex, Y" inside the procedure, the way johns-way does.
- Each `SKILL.md` is under 60 lines. Files beside it load on demand and are outside the budget.
- `disable-model-invocation: true` in the frontmatter pairs with `allow_implicit_invocation: false` in `agents/openai.yaml`. The check enforces the pair.
- Write for a reader who was not in the session: the rule, never the episode that taught it.
- The installed links point at this checkout, so an edit applies at once. Codex needs a new thread to see a new skill.
