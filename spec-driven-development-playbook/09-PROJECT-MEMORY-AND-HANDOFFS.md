# 9. Memory and Handoffs

Chat dies. Files do not. If the next session cannot start from the repo, the last session did not finish.

## What lives where

| Kind | File |
| --- | --- |
| Why this exists | `PROJECT.md` |
| What must be true | `REQUIREMENTS.md` |
| Why we chose the expensive thing | `docs/decisions/` |
| How it is shaped | `ARCHITECTURE.md` |
| How this milestone will be built | Active plan |
| What the coding agent is allowed to do | `AGENTS.md` + the Approved plan |
| Queue | `TASKS.md` |
| What is true *right now* | `HANDOFF.md` |
| Proven behavior | Tests |
| Findings that must survive | `docs/reviews/` (rare) |
| What a user would notice | `CHANGELOG.md` |

Do not keep a second copy of any of these in GitHub Issues.

## Handoff

A handoff answers:

- Which plan and phase?
- Which branch / SHA?
- What was just proven, with commands?
- What is still false?
- What is the next task — or is this a phase checkpoint?
- What would be stupid to do next?

It is not a diary. History is git.

At session start, **do not trust it**. Check branch, SHA, dirty tree, task statuses, and whether the cited tests still exist.

## End of every loop

Update `HANDOFF.md` and `TASKS.md` to match reality. If you claim a check passed, the command ran.

```text
Update HANDOFF.md with: plan, phase, branch, SHA, last task, commands
and exact results, remaining falsehoods, next task or phase checkpoint.
No secrets. No "should be fine."
```
