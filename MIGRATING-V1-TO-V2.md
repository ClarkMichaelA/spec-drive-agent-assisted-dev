# Migrating from v1 to v2

Version 2 changes the starter kit's packaging and default Git workflow. It does not require existing projects to replace their specifications, source code, tests, or history.

## What changed

- The shared scaffold is runtime-neutral.
- Grok Build, Codex, and Claude Code receive separate native adapters.
- Every release contains one complete ZIP per runtime.
- `docs/WORK_PLAN.md` owns the portable delivery-loop contract.
- `main` is the protected integration and release branch; version tags identify releases.

## Existing Grok Build projects

Do not copy the full v2 scaffold over an active project.

1. Compare your `AGENTS.md` with the v2 file and adopt only rules that remain true for your project.
2. Add `docs/WORK_PLAN.md` and update local references to the delivery loop.
3. Compare `.grok/workflows/work-plan.rhai`; preserve project-specific commands and review policy.
4. Decide separately whether changing the integration branch from `v1` to `main` is worth the disruption.
5. Run the project's real validation before committing the migration.

An existing `v1` branch may remain until its current plan or release finishes. Do not rename or delete a shared branch while another clone, pull request, or automation still depends on it.

## Moving to Codex or Claude Code

Keep the common project files and add only the chosen v2 target adapter. Remove the old `.grok/` directory only after confirming no Grok Build user or automation still needs it.

The Claude Code edition ships `.claude/settings.json`. Merge it into the file your project already has instead of overwriting it, and read the adapter's `RUNTIME.md` for what the `work-plan` skill pre-approves.

The runtime ZIPs are starter packages, not in-place updaters. Treat migration as a reviewed project change.
