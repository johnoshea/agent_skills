# Cold read

The cold read is off. To turn it back on, make four edits:

- Move the two sections below into `SKILL.md` in place of its Cold read section.
- Add "on every explanation before sending it" back to the skill's description.
- End the table's `commit` row with "For `commit`, follow Commit messages below."
- In johns-way, list the cold reader among the routing skill's subagent jobs again.

## Commit messages

The reader of a commit message has the diff and nothing else. Having been in the session, I cannot tell which phrases only the session explains. A reader with no session context can.

1. Draft the message.
2. Dispatch one subagent in the foreground with fresh context: in Claude Code, a general-purpose agent; in Codex, a fresh subagent. Give it the draft and the output of `git diff --cached`, and nothing else. Do not summarise the change for it. Ask it for four things:
   - phrases it cannot resolve from the message and the diff alone
   - sentences it had to read twice
   - sentences a person would not say out loud, each with a plain version
   - whether the message says what the change does and gives a reason the diff alone would not show
3. Rewrite the message from its answer. One round.
4. Commit.

Without subagents, do step 2 alone: one sentence at a time, asking whether every noun would be clear to someone who has never seen this repository or this conversation.

## Explanations

An explanation is a reply of more than three sentences that says how something works or what a change would do. Before sending one:

1. Draft the reply.
2. Dispatch one subagent in the foreground with fresh context, as for a commit message. Give it the draft and nothing else. Ask it for four lists:
   - words or phrases the draft does not define and ordinary English does not cover
   - sentences in which no one is named as doing the action
   - sentences a person would not say out loud, each with a plain version
   - sentences it had to read twice
3. Rewrite from its answer. One round.
4. Send.
