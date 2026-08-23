# Runtime: Grok Build

This scaffold uses Grok Build's native workflow runtime.

- Persistent project instructions: `AGENTS.md`
- Delivery contract: `docs/WORK_PLAN.md`
- Native implementation: `.grok/workflows/work-plan.rhai`
- Invocation: `/work-plan`

Approve an implementation plan, then run `/work-plan`. The workflow assesses the next authorized task, delegates implementation and fresh-context reviews, commits completed tasks on the plan branch, and stops at a phase, blocker, or task cap.

If the native workflow is unavailable, prompt Grok Build to read `AGENTS.md` and execute `docs/WORK_PLAN.md` directly.
