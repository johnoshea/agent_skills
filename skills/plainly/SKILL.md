---
name: plainly
description: Rewrite text in plain language to ISO 24495-1, whether the last reply in chat, code comments in a file, a commit message or issue text, or a doc file in the repo. Run on every commit message before committing, on every explanation before sending it, and when John asks for a rewrite.
argument-hint: "blank for my last reply, or a file path, or 'commit' / 'issue'"
---

# plainly

Rewrite the target in plain language, ISO 24495-1:2023. Change only the wording. The meaning, the scope, and the underlying work stay as they are.

| Argument | Target | Also |
|---|---|---|
| *(blank)* | My most recent reply | Chat only. Write nothing to disk. |
| A source file path | The comments in that file | Comments only, never code. Delete comments that restate what the code says. Keep the file's line length and comment density. |
| A `.md` path | That document | Keep headings, links and code blocks intact. |
| `commit` or `issue` | The message being drafted | The reader wasn't in this session. Cut session shorthand, past runs, hostnames, ticket IDs (unless they're referencing other issues), and anything the diff already shows. For `commit`, follow Commit messages below. |

If the argument is ambiguous, ask which target he means.

The writing style section of John's CLAUDE.md is stricter than the standard. Follow it.

## Commit messages

The reader of a commit message has the diff and nothing else. Having been in the session, I cannot tell which phrases only the session explains. A reader with no session context can.

1. Draft the message.
2. Dispatch one subagent in the foreground with fresh context: in Claude Code, a general-purpose agent; in Codex, a fresh subagent. Give it the draft and the output of `git diff --cached`, and nothing else. Do not summarise the change for it. Ask it to list every phrase it cannot resolve from the message and the diff alone, every sentence it had to read twice, and whether the message says what the change does and gives a reason the diff alone would not show.
3. Rewrite the message from its answer. One round.
4. Commit.

Without subagents, do step 2 alone: one sentence at a time, asking whether every noun would be clear to someone who has never seen this repository or this conversation.

## Explanations

An explanation is a reply of more than three sentences that says how something works or what a change would do. Before sending one:

1. Draft the reply.
2. Dispatch one subagent in the foreground with fresh context, as for a commit message. Give it the draft and nothing else. Ask it for three lists:
   - words or phrases the draft does not define and ordinary English does not cover
   - sentences in which no one is named as doing the action
   - sentences it had to read twice
3. Rewrite from its answer. One round.
4. Send.
