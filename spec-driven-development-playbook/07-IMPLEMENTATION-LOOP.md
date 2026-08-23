# 7. The implementation loop

## Goal

The coding agent does substantial work. You steer the plan. Each change remains small, proven, and reversible.

The rendered scaffold owns the normative contract in `docs/WORK_PLAN.md`. This chapter explains why it has that shape.

## Do not say “finish the milestone”

An unattended backlog lets one bad assumption become eight commits. The useful unit of autonomy is the **phase**, not the product.

## Who does what

You:

- Approve the plan
- Answer stops: wrong plan, new hard choice, or checks that remain red
- Use the software at a phase checkpoint
- Merge the phase into `main`

The coding agent:

- Picks the next authorized task
- Works on the plan branch
- Implements the smallest change satisfying the criteria
- Runs the real checks
- Uses fresh-context review when it pays
- Fixes required findings
- Updates `TASKS.md` and `HANDOFF.md`
- Stops at the phase or sooner

You do not Ready or merge an individual task.

## The loop

```text
On plan/<milestone> off main:

1. Read AGENTS.md, RUNTIME.md, the Approved plan, TASKS.md, and HANDOFF.md
2. Verify git matches the handoff
3. Take the next task the plan already authorized
4. Implement, add tests, and run the task's checks
5. Fresh-context test review
   + security review only when the plan or changed trust surface requires it
   + use the UI when a user can see the change
6. Fix required findings
7. Commit on the plan branch; do not merge to main
8. Take the next Ready task
9. Stop when the phase, task cap, or another stop condition is reached
```

Then you run the product. Merge the phase PR, continue, or change the plan.

## Invoke it

Each rendered edition includes one native entry point:

- Grok Build: `/work-plan`
- Codex: `$work-plan`
- Claude Code: `/work-plan`

`RUNTIME.md` in the scaffold is authoritative for the installed edition. If an entry point is unavailable, use this portable prompt:

```text
The plan at [PATH] is Approved. Read AGENTS.md, RUNTIME.md, and
docs/WORK_PLAN.md. Execute the work-plan contract until the next phase
checkpoint, blocker, or task cap. Stop if the plan is wrong.
```

## Context

Do not dump the repository into every turn. Provide:

- `AGENTS.md`, `RUNTIME.md`, and the selected role
- The Approved plan
- The current task and linked requirements, decisions, and architecture sections
- Relevant code and tests
- `HANDOFF.md`

## Stop rather than improvise

Stop when:

- Approved sources disagree
- A Must is missing or ambiguous
- A new expensive decision appears
- A public contract, schema, or trust boundary would change outside the plan
- Required checks fail and the repair is outside the task
- Git does not match the handoff
- Secrets appear
- The next work is not in the plan

For a low-impact reversible gap, use the conservative option, record the assumption, and continue.

## Reviews that pay

| Check | When | Why |
| --- | --- | --- |
| Tests and commands in `AGENTS.md` | Every task | This is the real gate |
| Fresh test review | After implementation | Catches criteria and failure-path gaps |
| Security | Plan time, plus relevant authentication, data, trust, or secret diffs | Unfocused security review is theater |
| UI | A user can see or click it | Code-only UX review does not exercise behavior |
| Documentation | The change made a specification false | Fix it in the same commit |

Same context with a new role name is a self-review. Say so. Use a fresh subagent or session when the review must disagree with the implementer.

Write `docs/reviews/` only when a finding, waiver, or release decision must survive.

## Source control for one person

```text
main                          protected, releasable integration
plan/M-01-short-name          work authorized by one Approved plan
v2.0.0                        immutable release tag
```

- No direct pushes to `main`
- No branch per task
- One coherent commit per task
- One phase PR from `plan/...` into `main`
- The human inspects the PR and running product before merging

GitHub is the scoreboard, not the dispatcher. Do not create an issue per task or a Project board that duplicates the plan.

## Inner prompt for one task

```text
Act as the Software Engineer in agents/software-engineer.md.
Read AGENTS.md, RUNTIME.md, the Approved plan, HANDOFF.md, and TASKS.md.
Take the next authorized task. Complete only that task.

Implement the smallest change, add tests, run the required commands,
review the diff, update TASKS.md and HANDOFF.md, commit on this plan
branch, do not merge to main, and stop.

Do not invent requirements or expand the plan.
If a check did not run, say so.
```

## After a phase

The coding agent reports what exists, commands and results, what remains false, and why it stopped. You use the product. If you only read the handoff, you will ship a story.

Once the one-task loop is boring and correct, a runtime adapter may take several tasks up to the contract's cap. It still stops on the first blocker and at the phase.
