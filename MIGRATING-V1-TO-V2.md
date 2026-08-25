# Migrating from v1 to v2

Version 2 separates the portable delivery method from its runtime adapters and changes the default Git workflow. It does not require existing projects to replace their specifications, source code, tests, or history.

## What changed

- The shared scaffold is runtime-neutral.
- Grok Build, Codex, and Claude Code receive separate native adapters.
- Every release contains one complete ZIP per runtime.
- `docs/WORK_PLAN.md` owns the portable delivery-loop contract.
- `main` is the protected integration and release branch; version tags identify releases.

## Migrate an existing v1 project

Do not copy the full v2 scaffold over an active project.

1. Compare your `AGENTS.md` with the v2 file and adopt only rules that remain true for your project.
2. Add `docs/WORK_PLAN.md` and update local references to the delivery loop.
3. Choose one runtime edition and merge its native adapter without replacing project-specific commands, permissions, or review policy.
4. Remove files for an old runtime only after confirming that no user or automation still depends on them.
5. Decide separately whether changing the integration branch from `v1` to `main` is worth the disruption.
6. Run the project's real validation before committing the migration.

An existing `v1` branch may remain until its current plan or release finishes. Do not rename or delete a shared branch while another clone, pull request, or automation still depends on it.

The runtime ZIPs are starter packages, not in-place updaters. Treat migration as a reviewed project change.

## Choose a runtime adapter

Grok Build, Codex, and Claude Code are peer implementations of the same contract in `docs/WORK_PLAN.md`. None of them owns or defines the common scaffold. Install only the adapter for the runtime the project uses.

### Grok Build

Compare `.grok/workflows/work-plan.rhai` with the project's existing workflow. Preserve project-specific commands and review policy, and read `RUNTIME.md` for invocation details.

### Codex

Add or compare `.agents/skills/work-plan/` and `.codex/agents/`. Preserve project-specific commands and review policy, keep reviewer agents read-only, and read `RUNTIME.md` for skill invocation, reviewer isolation, permissions, and Git boundaries. Codex permissions remain a per-turn user choice; the adapter does not install a personal `config.toml`.

### Claude Code

Add or compare `CLAUDE.md` and `.claude/`. Merge `.claude/settings.json` into the file the project already has instead of overwriting it, preserve project-specific commands and review policy, and read `RUNTIME.md` for skill permissions, hooks, and shell selection.
