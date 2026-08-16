# 12. How Much Process

Default: one person, Grok Build, one plan, one branch.

Add a file or a meeting only when a real failure would have been cheaper than the paper.

## Solo / this kit's default

- Specs in the repo
- One approved plan with 2–4 phases
- `/work-plan` or an equivalent prompt
- Tests + CI
- You at each phase, looking at the product
- One PR into `v1`

Do not add: issue tracker, Project board, per-task PRs, four reviewer agents, a docs site of process.

If it is a prototype, collapse to `SPEC.md` + a short plan + tests. Say what you are not claiming (security, ops, scale).

## Small thing you will actually run

Add: journeys, requirements, ADRs for expensive choices, architecture, roadmap, security and ops *sections* (not necessarily extra files), CI, a release look.

## Higher risk (money, identity, other people's data, hard to undo)

Add only what that risk needs: threat model, data rules, contract tests, migration plan, a durable security review, backup/restore you have actually done.

Do not add them "for completeness."

## Grok Build

This is the runtime the loop is written for.

- `AGENTS.md` is the working agreement Grok loads
- `agents/*.md` are perspectives, not processes
- `/work-plan` is the delivery loop
- Subagents give you a fresh context for review
- Worktrees are for parallel edits you should usually not be doing

Other tools can read the Markdown. They will not have `/work-plan` unless you rebuild it.

## GitHub

Useful:

- Protected `v1`
- PR for a phase
- Actions running the same commands as `AGENTS.md`

Not useful, for you:

- Issue per task
- Project as the board
- Comment commands to "notify agents" — you are already in Grok
- CODEOWNERS theater with one owner

If a second human appears, then maybe Issues. Keep requirement IDs on them. Do not let Issues become a second `REQUIREMENTS.md`.

## Parallelism

Do not. Not until the single-task loop is boringly correct and two workstreams do not touch the same files.

Then: separate plan branches, contract tests at the join, no shared `HANDOFF.md` writes.

Role files do not make this safe.

## Context

As the repo grows: keep `docs/INDEX.md` honest, link tasks to sections, archive finished plans, do not make Grok read everything.

## Three levels. Stop climbing for sport.

1. **Files exist** — intent, decisions, plan, tests, handoff are in git
2. **The loop works** — Grok can take the next task and stop for a reason
3. **The gate is a command** — CI fails the change you would have shipped by accident

Level 5 autonomous swarm is how you get a confident mess. You are not a platform team.
