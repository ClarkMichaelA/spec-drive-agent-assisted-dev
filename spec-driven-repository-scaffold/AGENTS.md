# Working Agreement

Grok Build reads this file. Keep it short. Details live in the doc that owns the question.

## 1. What this is

Project: `[PROJECT NAME]`

Purpose: `[ONE OR TWO SENTENCES]`

Users: `[WHO]`

Stage: `[DISCOVERY | PLANNING | DELIVERY | PILOT | PRODUCTION]`

Runtime: Grok Build. Specs are files; another assistant can read them. The loop is `/work-plan`.

## 2. You vs Grok

The human approves: brief, requirements, expensive decisions, the **plan**, each **phase** (by using the software), merge to `v1`, release.

The human does **not** Ready tasks, merge task PRs, or run four reviewer roles on a padding change.

Grok implements the next authorized task, proves it, commits on the plan branch, repeats until a phase checkpoint or a stop.

## 3. Read first

1. This file
2. `docs/INDEX.md`
3. The role file under `agents/` if one is selected
4. `HANDOFF.md` — then verify it against git
5. The **Approved** plan in `docs/plans/active/`
6. Only the requirements, ADRs, architecture section, task, code, and tests that plan points at

Chat is not a source of truth.

## 4. Authority

1. Approved requirements and current human direction
2. Accepted decision records
3. Approved architecture and security docs
4. The Approved plan
5. The current task's acceptance criteria
6. This file
7. The selected role
8. `HANDOFF.md`
9. Existing code, unless the code is the bug

Conflict → stop. Do not pick a winner. Do not edit an Approved file to match the code you just wrote.

A role cannot override this file or an Approved spec.

## 5. Rules

- Do not invent requirements, outside facts, or success criteria.
- Do not expand the plan because an adjacent fix looks nice.
- Do not add a production dependency, public interface, migration, or trust-boundary change unless the plan already has it — or you stop and propose an ADR.
- Never put secrets in the repo, logs, fixtures, or prompts.
- Smallest change that makes the criteria true.
- Behavior change ⇒ tests.
- Do not claim a check passed if it did not run.
- Update `TASKS.md` and `HANDOFF.md` before you stop.

## 6. The loop

The Approved plan authorizes the queue. Do not wait to be told a task is Ready.

1. Confirm the plan is Approved and you are on `plan/…` (create it from `v1` if needed).
2. Take the next task whose dependencies are Done and whose criteria are testable.
3. Restate the criteria in one short paragraph.
4. Read the code and tests that already exist.
5. Change the smallest coherent surface.
6. Add or update tests, including the failure the criteria name.
7. Run the validation for this task. Same commands CI will run.
8. If the plan marked this task for security review, or a user can see the change, do that review in a **fresh** context. Behavior review in a fresh context after implement.
9. Fix required findings.
10. Update only the docs the change made false.
11. Mark the task Done on the plan branch. Commit. **Do not merge to `v1`.**
12. If the phase is done or a stop hit, halt and say what to look at. Otherwise take the next task.

`/work-plan` is this loop. Prefer it.

## 7. Ready and Done

A task is **Ready** when the Approved plan includes it, dependencies are Done, criteria are observable, and no expensive question is open. You (the agent) check this. The human already approved the plan.

A task is **Done** when criteria are true, required commands ran, needed reviews finished or were waived, and state files match git. Done ≠ merged to `v1`. Merge is a phase event the human does.

## 8. Stops

**Green — go:** implement the next authorized task; add tests; fix a local defect; refactor with no behavior change; make a doc match Approved behavior.

**Yellow — stop and propose:** new production dependency; public interface; migration; auth/trust change; architecture deviation; work that is not in the plan.

**Red — do not do this:** production deploy; real-data destruction; secrets; permission escalation; disable a control; irreversible conversion; send mail / spend money.

Also stop when: sources conflict, a Must is missing, checks stay red, git ≠ handoff, secrets in the tree.

Low-impact reversible gap: conservative assumption, write `docs/ASSUMPTIONS.md`, continue.

## 9. Reviews that pay

| When | What |
| --- | --- |
| Every implementation task | Tests + the commands below |
| After implement | Fresh-context test review |
| Plan marked the task (auth, data, trust, secrets) | Fresh-context security review |
| User can see or click it | Exercise the UI. Do not accept "the code looks friendly." |
| A spec file is now false | Fix it in the same commit |

Same session, new role name, is a self-review. Say so.

Write `docs/reviews/` only for a finding, waiver, or release call that must survive. Not as a receipt that a role ran.

## 10. Git

```text
main     last good
v1       protected integration
plan/<milestone>-<slug>    where you commit
```

No commits to `v1`. No branch per task. Commit per task. Phase lands as one PR into `v1`. The human merges.

## 11. Commands

Replace these. If a line is not real, write `N/A` — do not leave a fake command.

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
| Behavior / a Must | `docs/REQUIREMENTS.md`, tests |
| An expensive choice | New ADR + `docs/ARCHITECTURE.md` |
| Milestone shape | `docs/ROADMAP.md` or the plan (human must re-approve material changes) |
| Task status | `TASKS.md` |
| Session state | `HANDOFF.md` |
| Something a user would notice | `CHANGELOG.md` |
| A new risk or guess | `docs/RISKS.md` / `docs/ASSUMPTIONS.md` |
| Auth / data / privacy | `docs/SECURITY.md` + tests |
| How it runs | `docs/OPERATIONS.md` |

No changelog for format-only, test-only, or invisible refactors.

## 14. When you stop

1. What is now true
2. Files
3. Commands and exact results
4. What is still false
5. State files touched
6. Next task, or "phase checkpoint — look at this"
