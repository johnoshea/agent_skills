# Cold read

The cold read is off. To turn it back on, make four edits:

- Move the two sections below into `SKILL.md` in place of its Cold read section.
- Add "on every explanation before sending it" back to the skill's description.
- End the table's `commit` row with "For `commit`, follow Commit messages below."
- In johns-way, list the cold reader among the routing skill's subagent jobs again.

## Commit messages

The reader of a commit message has the diff and nothing else. Having been in the session, I cannot tell which phrases are clear only to someone who was in the session. A reader with no session context can.

1. Draft the message.
2. Dispatch one subagent in the foreground with fresh context: in Claude Code, a general-purpose agent; in Codex, a fresh subagent. Give it the draft and the output of `git diff --cached`, and nothing else. Do not summarise the change for it. Ask it for four things:
   - phrases it cannot resolve from the message and the diff alone
   - sentences it had to read twice
   - sentences a person would not say out loud, each with a plain version
   - whether the message contains what was changed and a reason not visible in the diff alone
3. Rewrite the message from its answer. One round.
4. Commit.

Without subagents, do step 2 alone: one sentence at a time, asking whether every noun would be clear to someone who has never seen this repository or this conversation.

## Explanations

An explanation is a reply of more than three sentences about how something works or the effect of a change. Before sending one:

1. Draft the reply.
2. Dispatch one subagent in the foreground with fresh context, as for a commit message. Give it the draft and nothing else. Ask it for four lists:
   - words or phrases not defined in the draft and not part of ordinary English
   - sentences where the subject of an action verb cannot execute
   - sentences a person would not say out loud, each with a plain version
   - sentences it had to read twice
3. Rewrite from its answer. One round.
4. Send.
