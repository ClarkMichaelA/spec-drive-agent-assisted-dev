# Spec-Driven, Agent-Assisted Development

A one-person development kit with a shared method and focused editions for Grok Build, Codex, and Claude Code.

You steer the problem, expensive decisions, plan, phase checkpoints, and release. The coding agent carries out the approved plan. The repository is memory; chat is not.

## Version 2

Version 2 separates the portable development method from runtime-specific entry points:

- **Common scaffold** — specifications, plans, roles, tests, handoffs, and working agreements.
- **Grok Build target** — native `.grok/workflows/work-plan.rhai` orchestration.
- **Codex target** — repository skill at `.agents/skills/work-plan/SKILL.md`.
- **Claude Code target** — `CLAUDE.md` plus `.claude/skills/work-plan/SKILL.md`.

Each release publishes three complete ZIP files. Choose one; do not combine them.

## Download

From the latest GitHub release, download the edition for the runtime you use:

- `spec-driven-dev-grok-v<version>.zip`
- `spec-driven-dev-codex-v<version>.zip`
- `spec-driven-dev-claude-v<version>.zip`

Each archive contains the playbook, license, and a rendered `spec-driven-repository-scaffold/` ready to copy into a project.

## Source layout

```text
spec-driven-development-playbook/       portable method + runtime guides
spec-driven-repository-scaffold/
|-- common/                              one source of truth
`-- targets/
    |-- grok/                            Grok Build adapter
    |-- codex/                           Codex adapter
    `-- claude/                          Claude Code adapter
scripts/build-releases.ps1               render and validate all editions
```

Target directories are overlays, not independent scaffolds. Shared behavior belongs in `common/`; only runtime discovery and invocation mechanics belong in `targets/`.

## Build the packages

```powershell
./scripts/build-releases.ps1 -Version 2.0.0
```

The command recreates `dist/`, validates target isolation and shared-file parity, and writes three ZIP files plus `SHA256SUMS.txt`.

## The method

```text
Idea
  -> brief
  -> journeys
  -> testable requirements
  -> only decisions expensive to reverse
  -> architecture those decisions force
  -> outcome roadmap
  -> one approved implementation plan
  -> the agent works one task at a time
  -> you inspect the running product at each phase
  -> merge or change the plan
```

Start with the [playbook](spec-driven-development-playbook/README.md). Source maintainers should read the [scaffold source guide](spec-driven-repository-scaffold/README.md).

## Minimum

For a small, low-risk project:

- One `SPEC.md` containing the brief, journeys, and requirements.
- ADRs only for choices that hurt to undo.
- One short plan with phases and tasks.
- Tests for the risky claims.
- `HANDOFF.md`.

Delete template files that answer no real question.

## Moving from version 1

Version 1 was Grok Build-focused. Existing projects do not need to regenerate their repositories. See [Migrating from v1 to v2](MIGRATING-V1-TO-V2.md) for selective adoption.

## License

[MIT](LICENSE). Keep the copyright notice if you copy a substantial portion.
