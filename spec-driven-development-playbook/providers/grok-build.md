# Grok Build

The Grok edition renders the common scaffold with `.grok/workflows/work-plan.rhai` and `RUNTIME.md`.

1. Fill in the real project and validation commands in `AGENTS.md`.
2. Approve one implementation plan.
3. Run `/work-plan`.
4. Inspect the running product when the workflow stops at a phase.

The native Rhai workflow enforces the task cap, delegates fresh-context review, and stops when the portable `docs/WORK_PLAN.md` contract requires it.

Reference: [Grok Build modes and workflows](https://docs.x.ai/build/modes-and-commands).
