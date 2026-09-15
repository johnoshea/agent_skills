---
name: plainly
description: Rewrite text in plain language to ISO 24495-1, whether the last reply in chat, code comments in a file, a commit message or issue text, or a doc file in the repo. Run on every commit message before committing, and when John asks for a rewrite.
argument-hint: "blank for my last reply, or a file path, or 'commit' / 'issue'"
---

# plainly

Rewrite the target in plain language, ISO 24495-1:2023. Change only the wording. The meaning, the scope, and the underlying work stay as they are.

| Argument | Target | Also |
|---|---|---|
| *(blank)* | My most recent reply | Chat only. Write nothing to disk. |
| A source file path | The comments in that file | Comments only, never code. Delete comments that restate what the code says. Keep the file's line length and comment density. |
| A `.md` path | That document | Keep headings, links and code blocks intact. |
| `commit` or `issue` | The message being drafted | The reader wasn't in this session. Cut session shorthand, past runs, hostnames, ticket IDs (unless they're referencing other issues), and anything the diff already shows. |

If the argument is ambiguous, ask which target he means.

The writing style section of John's CLAUDE.md is stricter than the standard. Follow it.
