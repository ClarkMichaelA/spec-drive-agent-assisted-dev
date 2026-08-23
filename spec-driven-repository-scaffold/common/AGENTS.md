# Working Agreement

Keep this file short. It is loaded as persistent project guidance; details belong in the document that owns the question.

## 1. Project

Project: `[PROJECT NAME]`

Purpose: `[ONE OR TWO SENTENCES]`

Users: `[WHO]`

Stage: `[DISCOVERY | PLANNING | DELIVERY | PILOT | PRODUCTION]`

Runtime: read `RUNTIME.md`. Specifications are files. The delivery contract is `docs/WORK_PLAN.md`.

## 2. Human and agent

The human approves the brief, requirements, expensive decisions, the **plan**, each **phase** by using the software, merge to `main`, and release.

The human does not Ready individual tasks, merge task-sized PRs, or run every reviewer role on every change.

The coding agent implements the next authorized task, proves it, commits on the plan branch, and repeats until a phase checkpoint or stop condition.

## 3. Read first

1. This file
2. `RUNTIME.md`
3. `docs/INDEX.md`
4. The selected role under `agents/`, if any
5. `HANDOFF.md` — then verify it against git
6. The **Approved** plan in `docs/plans/active/`
7. `docs/WORK_PLAN.md` when executing that plan
8. Only the requirements, decisions, architecture sections, code, and tests linked by the plan

Chat is not a source of truth.

## 4. Authority

1. Approved requirements and current human direction
2. Accepted decision records
3. Approved architecture and security documents
4. The Approved plan
5. The current task's acceptance criteria
6. This file
7. The selected role
8. `HANDOFF.md`
9. Existing code, unless the code is the bug

Conflict means stop. Do not pick a winner or edit an Approved file to match code you just wrote. A role cannot override this file or an Approved specification.

## 5. Rules

- Do not invent requirements, outside facts, or success criteria.
- Do not expand the plan because an adjacent fix looks useful.
- Do not add a production dependency, public interface, migration, or trust-boundary change unless the plan authorizes it; otherwise stop and propose a decision record.
- Never put secrets in the repository, logs, fixtures, or prompts.
- Make the smallest change that makes the criteria true.
- Behavior change means tests.
- Do not claim a check passed if it did not run.
- Update `TASKS.md` and `HANDOFF.md` before stopping.

## 6. Delivery loop

The Approved plan authorizes the queue. Do not wait for the human to mark each task Ready.

Follow `docs/WORK_PLAN.md`. The runtime-specific entry point in `RUNTIME.md` invokes the same contract.

## 7. Ready and Done

A task is **Ready** when the Approved plan includes it, dependencies are Done, criteria are observable, and no expensive question is open. The agent checks this; the human already approved the plan.

A task is **Done** when criteria are true, required commands ran, needed reviews finished or were waived, and state files match git. Done is not merged. Merge is a phase event the human controls.

## 8. Stops

**Green — proceed:** implement the next authorized task; add tests; fix a local defect; refactor without behavior change; make a document match Approved behavior.

**Yellow — stop and propose:** new production dependency; public interface; migration; authentication or trust change; architecture deviation; work outside the plan.

**Red — do not perform:** production deployment; real-data destruction; secret disclosure; permission escalation; disabling a control; irreversible conversion; sending messages or spending money.

Also stop when sources conflict, a Must is missing, checks remain red, git contradicts the handoff, or secrets appear in the tree.

For a low-impact reversible gap, choose the conservative assumption, record it in `docs/ASSUMPTIONS.md`, and continue.

## 9. Reviews that pay

| When | What |
| --- | --- |
| Every implementation task | Tests and the commands below |
| After implementation | Fresh-context test review |
| Plan-marked authentication, data, trust, or secret changes | Fresh-context security review |
| A user can see or click it | Exercise the UI |
| A specification is now false | Fix it in the same commit |

Same context with a different role name is a self-review. Say so.

Write `docs/reviews/` only for a finding, waiver, or release decision that must survive. Do not create a receipt merely because a role ran.

## 10. Git

```text
main                          protected, releasable integration
plan/<milestone>-<slug>       approved-plan implementation
v<major>.<minor>.<patch>      immutable release tag
```

No direct commits to `main`. No branch per task. Commit once per coherent task. A completed phase lands as one PR into `main`; the human inspects the product and merges.

Create `release/<major>.x` only when an older major version genuinely needs maintenance after a newer major exists.

## 11. Commands

Replace these. If a line is not real, write `N/A`; do not leave a fake command.

```text
Environment setup: [COMMAND OR N/A]
Build:             [COMMAND]
Format check:      [COMMAND]
Static analysis:   [COMMAND]
Unit tests:        [COMMAND]
Integration tests: [COMMAND OR N/A]
Security checks:   [COMMAND OR N/A]
Full validation:   [COMMAND]
Run locally:       [COMMAND]
```

## 12. Conventions

```text
Primary language(s):       [LANGUAGES]
Runtime/framework:         [RUNTIME OR FRAMEWORK]
Package/dependency policy: [POLICY]
Formatting standard:       [STANDARD OR TOOL]
Error-handling convention: [CONVENTION]
Logging convention:        [CONVENTION]
Configuration approach:    [CONVENTION]
Testing convention:        [CONVENTION]
Documentation style:       [CONVENTION]
```

## 13. What to update

| If you changed | Update |
| --- | --- |
| Behavior or a Must | `docs/REQUIREMENTS.md`, tests |
| An expensive choice | New decision record and `docs/ARCHITECTURE.md` |
| Milestone shape | `docs/ROADMAP.md` or the plan; material plan changes require human re-approval |
| Task status | `TASKS.md` |
| Session state | `HANDOFF.md` |
| Something a user would notice | `CHANGELOG.md` |
| A new risk or assumption | `docs/RISKS.md` or `docs/ASSUMPTIONS.md` |
| Authentication, data, or privacy | `docs/SECURITY.md` and tests |
| How it runs | `docs/OPERATIONS.md` |

Do not add changelog entries for formatting-only, test-only, or invisible refactoring changes.

## 14. When you stop

Report:

1. What is now true
2. Files changed
3. Commands and exact results
4. What is still false
5. State files touched
6. Next task, or `phase checkpoint — inspect this`
