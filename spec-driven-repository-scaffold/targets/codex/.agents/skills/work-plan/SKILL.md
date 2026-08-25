---
name: work-plan
description: Execute or continue tasks from an Approved spec-driven implementation plan to the next phase checkpoint, blocker, or task cap. Use for plan delivery on a plan branch; do not use to draft a plan, change scope, or perform ad hoc work.
---

# Work plan

`docs/WORK_PLAN.md` is the delivery contract. This skill adapts that contract to Codex; it does not replace it. `AGENTS.md` has higher authority than both.

## 1. Assess before editing

Read `RUNTIME.md`, `docs/WORK_PLAN.md`, the plan under `docs/plans/active/`, `TASKS.md`, and `HANDOFF.md`. Inspect the current branch, working tree, and recent commits. Verify the repository state yourself; chat and `HANDOFF.md` are leads, not proof.

Choose one state and report it:

- **Continue** — exactly one plan is Approved, the branch matches `plan/<milestone>-<slug>`, state files agree with Git, and the next task is Ready.
- **Idle** — no Approved plan or no remaining authorized task. Stop without inventing work.
- **Blocked** — sources conflict, Git contradicts the handoff, criteria are not observable, or an expensive decision is open. Stop and name the decision or mismatch.

After choosing Continue, read only the requirements, decisions, architecture sections, code, and tests linked by the next task.

## 2. Deliver one task

Restate the task's observable acceptance criteria. Make the smallest coherent change that makes them true. Add or update tests, including the named failure or boundary path, then run the task's required validation using the commands in `AGENTS.md`. A command that did not run did not pass.

Exercise the running UI when a user can see or click the change. Do not substitute code inspection for interaction.

## 3. Obtain fresh reviews

After implementation, spawn `test_engineer` as a fresh subagent. Also spawn `security_reviewer` when the plan marks the task or the diff touches authentication, authorization, data, trust boundaries, secrets, or dangerous input. When both are required, start them together and wait for both.

Give each reviewer the task id, acceptance criteria, linked requirement ids, plan path, and current diff or SHA. The project-scoped agent files under `.codex/agents/` keep reviewers read-only; the role files under `agents/` define what they review.

Fix required findings in the implementing context, add regression coverage, and rerun validation. Stop if a required finding cannot be resolved inside the authorized task. If Codex cannot spawn a subagent, perform and label a self-review; never call it independent.

## 4. Record and commit

Update only the documents made false by the change. Make `TASKS.md` and `HANDOFF.md` agree with Git, then create one coherent task commit on the plan branch.

Never push, merge to `main`, rewrite shared history, deploy, or release. Those actions are outside this skill even if the current permission mode would allow them.

## 5. Repeat or stop

Complete at most three tasks per invocation unless the human requests a lower cap. Stop earlier at a completed phase or any contract stop condition. The cap limits unattended work; it does not authorize work outside the current phase.

Return the seven checkpoint items required by `docs/WORK_PLAN.md`: tasks completed, branch and SHA, exact validation results, reviews and required findings, documents and state files updated, halt reason, and what the human should inspect next.
