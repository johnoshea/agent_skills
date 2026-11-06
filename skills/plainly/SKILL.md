---
name: plainly
description: Rewrite text in plain language to ISO 24495-1, whether the last reply in chat, code comments in a file, a commit message, issue text, a pull request description, or a doc file in the repo. Run on every commit message before committing, on every issue title, body, and comment before posting, on every pull request description before opening it, and when John asks for a rewrite.
argument-hint: "blank for my last reply, or a file path, or 'commit' / 'issue'"
---

# plainly

Rewrite the target in plain language, ISO 24495-1:2023. Change only the wording. The meaning, the scope, and the underlying work stay as they are.

| Argument | Target | Also |
|---|---|---|
| *(blank)* | My most recent reply | Chat only. Write nothing to disk. |
| A source file path | The comments in that file | Comments only, never code. Delete comments that only repeat what is clear from the code. Keep the file's line length and comment density. |
| A `.md` path | That document | Keep headings, links and code blocks intact. |
| `commit` or `issue` | The message being drafted | The reader wasn't in this session. Cut session shorthand, past runs, hostnames, ticket IDs (unless they're referencing other issues), and anything already visible in the diff. |

If the argument is ambiguous, ask which target he means.

The Writing style and Who acts in a sentence sections of John's CLAUDE.md are stricter than the standard. Follow them.

## Actor check

After the rewrite, make one more pass, for actors only.

1. For each action verb, find its subject. Include subjects in relative
   clauses ("a status that makes...") and pronouns ("when it waits...").
2. If the subject cannot execute, rewrite the sentence with the patterns
   in the Who acts in a sentence section of John's CLAUDE.md.
3. If the verb is a verb of mind, check that its subject is a person.
4. For each "whose", "its" and "has", check the direction of the
   relationship.

## Cold read

The cold read is off. Its procedure is in `references/cold-read.md`. Leave that file unloaded until John turns the cold read back on.
