# 7. The Implementation Loop

## Goal

Grok does a lot. You steer the plan. Each change is small, proven, and reversible.

## Do not say "finish the milestone"

An unattended backlog is how one bad assumption becomes eight commits. Your own later self cannot tell where it went wrong.

The unit of autonomy is **the phase**, not the product.

## Who does what

You:

- Approve the plan
- Answer stops (plan wrong, new hard choice, tests stay red)
- Use the software at a phase checkpoint
- Merge the phase into `v1`

Grok:

- Picks the next authorized task
- Branches if needed, usually just commits on the plan branch
- Implements the smallest change that satisfies the criteria
- Runs the tests
- Calls a fresh reviewer only when it pays
- Fixes required findings
- Updates `TASKS.md` and `HANDOFF.md`
- Stops at the phase, or sooner

You do not Ready T-014. You do not merge T-014.

## The loop

```text
On plan/<milestone> off v1:

1. Read AGENTS.md, the approved plan, TASKS.md, HANDOFF.md
2. Verify git state matches the handoff
3. Take the next task the plan already authorized
4. Implement, add tests, run the task's checks
5. Fresh-context review for behavior
   + security only if the plan marked this task
   + use the UI if a user can see the change
6. Fix required findings
7. Commit on the plan branch. Do not merge to v1.
8. Next task
9. Phase done, or a stop condition -> halt
```

Then you run the thing. Then merge the phase PR, continue, or change the plan.

In Grok Build, that loop is `/work-plan`. Or:

```text
The plan at [PATH] is Approved. Work it until the next phase checkpoint.
Follow AGENTS.md. One task at a time. Stop if the plan is wrong.
```

## Context

Do not dump the whole repo into every turn. Give Grok:

- `AGENTS.md` and the role file
- The approved plan (the map)
- The current task and its linked requirements / ADRs / architecture section
- The relevant code and tests
- `HANDOFF.md`

## Stop. Do not be clever.

Stop and say so when:

- Approved sources disagree
- A Must is missing or mushy
- A new expensive decision appeared
- A public contract, schema, or trust boundary would change outside the plan
- Required checks fail and the fix is outside the task
- The repo does not match the handoff
- Secrets showed up
- The next work is not in the plan

Low-impact reversible gap: pick the conservative option, write it in `ASSUMPTIONS.md`, continue.

## Reviews that pay

| Check | When | Why |
| --- | --- | --- |
| Tests + the commands in `AGENTS.md` | Every task | This is the real gate |
| Fresh test review | After implement | Separate context. Cheap. Catches "tests that test the mocks." |
| Security | Plan time, plus a diff check if the task touches auth, data, trust, or secrets | A security pass on a CSS tweak is theater |
| UI | User can see or click it | Read the screen. Click the path. Code-only UX review is mostly taste. |
| Docs | The change made a spec file false | Fix it in the same commit. A docs-reviewer agent every task is noise. |

Same chat, new hat, "independent review" is a lie. Label it self-review. Fresh subagent or fresh session if it needs to disagree.

Do not write `docs/reviews/` because a role ran. Write a record when a finding, waiver, or release decision has to survive.

## Source control (one person)

```text
main     last good / released
v1       protected integration line for this version
plan/M-01-short-name    the approved plan lives here
```

- No direct pushes to `v1`
- No branch per task
- Commit per task, message says the outcome
- Phase done → one PR `plan/…` → `v1`
- You look at that PR and the running software
- Merge deletes nothing important; keep the plan file and move it when the whole plan is done

GitHub is the scoreboard (the PR). It is not the dispatcher. Do not open an issue per task. Do not build a Project board that will rot by Thursday.

## Inner prompt (one task, if you are not using `/work-plan`)

```text
Act as the Software Engineer in agents/software-engineer.md.
Read AGENTS.md, the approved plan, HANDOFF.md, and TASKS.md.
Take the next authorized task. Complete only that task.

Implement the smallest change, add tests, run the required commands,
review the diff, update TASKS.md and HANDOFF.md, commit on this
plan branch, do not merge to v1, stop.

Do not invent requirements. Do not expand the plan.
If a check did not run, say so.
```

## After a phase

Grok reports: what exists, commands and results, what is still false, whether to continue or merge.

You actually use it. If you only read the handoff, you will ship a story.

## Later, maybe

Once the single-task loop is boring and correct, `/work-plan` may take several tasks up to the phase cap. Still stop on the first snag. Still stop at the phase.

Do not parallelize two implementers on one codebase. You will merge with yourself and lose.
