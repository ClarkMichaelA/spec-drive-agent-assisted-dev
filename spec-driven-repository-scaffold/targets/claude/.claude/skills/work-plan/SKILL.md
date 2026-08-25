---
name: work-plan
description: Execute tasks from an Approved spec-driven implementation plan until the next phase checkpoint, blocker, or task cap.
when_to_use: The human asks to execute, continue, or burn down an Approved implementation plan, or asks for the next task on the plan branch. Not for drafting a plan, changing scope, or working when no plan under docs/plans/active/ is Approved.
argument-hint: "[max-tasks]"
arguments: max_tasks
allowed-tools: >
  Read Grep Glob Agent
  Bash(git status:*) Bash(git branch:*) Bash(git log:*) Bash(git diff:*)
  Bash(git add:*) Bash(git commit:*)
---

# Work plan

`docs/WORK_PLAN.md` is the contract. This file is only how Claude Code executes it. The contract wins any disagreement, and `AGENTS.md` wins over both.

## State at invocation

- Branch: !`git branch --show-current`
- Uncommitted: !`git status --short`
- Recent commits: !`git log --oneline -5`
- Active plans: !`ls docs/plans/active`

## 1. Assess

Read `RUNTIME.md`, `docs/WORK_PLAN.md`, the plan under `docs/plans/active/`, `TASKS.md`, and `HANDOFF.md`. Then read only the requirements, decisions, architecture sections, code, and tests that plan links. Check the state above against `HANDOFF.md` yourself.

Choose one and say which:

- **Continue** — one plan is Approved, the branch is `plan/<milestone>-<slug>`, the next task's dependencies are Done, and its criteria are observable.
- **Idle** — no Approved plan, or no remaining authorized task. Stop. Do not invent a task.
- **Blocked** — the plan is wrong, sources conflict, git contradicts the handoff, or an expensive question is open. Stop and state the question.

## 2. Deliver one task

Follow the one-task loop in `docs/WORK_PLAN.md`: restate the criteria, make the smallest coherent change, add tests including the named failure path, and run the task's validation using the commands in `AGENTS.md`. A command you did not run did not pass.

## 3. Review

Dispatch reviewers in a single message so they run in parallel:

| When | Subagent |
| --- | --- |
| Every implementation task | `test-engineer` |
| The plan marked the task, or the diff touches authentication, data, trust, or secrets | `security-reviewer` |
| A user can see or click the change | Exercise it yourself with the run command in `AGENTS.md` |

Give each reviewer the task id, its acceptance criteria, the linked requirement ids, the plan path, and the SHA or diff. They have no write tools, so fix required findings yourself, add the regression test, and re-run validation. Stop if a required finding cannot be fixed inside the task.

If no subagent can be spawned, review the diff yourself and label it a self-review. Never present it as independent.

## 4. Commit

Update `TASKS.md` and `HANDOFF.md` to match git, then commit the task on the plan branch. Use one git command per call: permission rules match each chained subcommand independently, so a compound command is refused rather than approved.

Never push, merge to `main`, rewrite shared history, deploy, or release. Those are outside this skill even when the current permission mode would allow them. A completed phase is a pull request the human merges after using the software.

## 5. Repeat or stop

Task cap: `$max_tasks` when that is a number, otherwise the three-task limit in `docs/WORK_PLAN.md`. Stop at a completed phase, the cap, or any stop condition in the contract.

## Checkpoint report

Return the seven items the contract requires: tasks completed, branch and SHA, validation commands with exact results, reviews and required findings, documents and state files updated, the halt reason, and what the human should inspect next.
