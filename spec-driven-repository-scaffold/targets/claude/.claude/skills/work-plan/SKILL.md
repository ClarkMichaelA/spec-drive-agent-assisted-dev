---
name: work-plan
description: Execute tasks from an Approved spec-driven implementation plan until the next phase checkpoint, blocker, or task cap.
---

# Work plan

Read `AGENTS.md`, `RUNTIME.md`, `docs/WORK_PLAN.md`, the Approved plan, `HANDOFF.md`, and `TASKS.md`.

Execute the portable contract in `docs/WORK_PLAN.md`. Preserve its authorization order, one-task loop, maximum of three tasks per invocation, fresh-context review requirements, per-task commits, and stop conditions.

Use fresh subagents for independent test and security reviews when available. Give each reviewer the relevant role from `agents/`, the task, linked requirements, plan, and current diff or SHA. If fresh context is unavailable, perform and label a self-review.

Never merge to `main`. Stop rather than inventing work or making an expensive decision the plan does not authorize.
