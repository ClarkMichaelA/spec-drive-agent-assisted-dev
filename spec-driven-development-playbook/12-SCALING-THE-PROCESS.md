# 12. How much process

Default: one person, one coding agent, one Approved plan, one plan branch.

Add a file or meeting only when the failure it prevents would have cost more than maintaining it.

## Solo—the kit's default

- Specifications in the repository
- One Approved plan with 2–4 phases
- The runtime's work-plan entry point or the portable prompt
- Tests and CI
- You at each phase, using the product
- One phase PR into `main`

Do not add an issue tracker, Project board, per-task PRs, four reviewer agents, or a process documentation site.

For a prototype, collapse to `SPEC.md`, a short plan, and tests. State what you are not claiming about security, operations, or scale.

## Something you will actually run

Add journeys, requirements, decision records for expensive choices, architecture, roadmap, security and operations sections, CI, and a release review. These do not all require separate files.

## Higher risk

For money, identity, other people's data, or hard-to-reverse changes, add only what the risk needs: threat model, data rules, contract tests, migration plan, durable security review, and backup or restore evidence.

Do not add them for completeness.

## Runtime adapters

The method is portable; discovery and invocation differ by runtime:

- [Grok Build](providers/grok-build.md)
- [Codex](providers/codex.md)
- [Claude Code](providers/claude-code.md)

Every rendered edition contains the same `AGENTS.md` and `docs/WORK_PLAN.md`, plus exactly one target adapter. Do not combine adapters.

## GitHub

Useful:

- Protected `main`
- One PR per phase
- Actions running the same commands as `AGENTS.md`
- Immutable version tags

Usually not useful for one person:

- Issue per task
- Project as a second task board
- Comment commands to notify the agent already doing the work
- CODEOWNERS with one owner

If a second human appears, Issues may help. Keep requirement IDs on them and do not let them become a second `REQUIREMENTS.md`.

## Parallelism

Do not parallelize implementation until the single-task loop is boringly correct and two workstreams do not touch the same files.

Then use separate plan branches, contract tests at the join, and no concurrent writes to one `HANDOFF.md`. Role files do not make shared edits safe.

## Context

As the repository grows, keep `docs/INDEX.md` honest, link tasks to exact sections, archive finished plans, and avoid making the agent read everything.

## Three useful levels

1. **Files exist** — intent, decisions, plan, tests, and handoff are in git
2. **The loop works** — the agent can take the next task and stop for a reason
3. **The gate is a command** — CI fails the change you would otherwise ship

Do not build an autonomous swarm merely because the tooling allows it.
