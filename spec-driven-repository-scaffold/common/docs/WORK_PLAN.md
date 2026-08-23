# Work-plan contract

This file defines the portable delivery loop. Runtime adapters may automate it differently, but they must preserve its authorization, evidence, review, commit, and stop semantics.

## Preconditions

Continue only when:

- One implementation plan under `docs/plans/active/` is **Approved**.
- The current branch is `plan/<milestone>-<slug>` created from `main`.
- The next task is authorized by that plan, its dependencies are Done, and its acceptance criteria are observable.
- `HANDOFF.md`, `TASKS.md`, and git describe the same current state.

Otherwise stop as idle or blocked. Do not invent a task.

## Invocation limit

Complete at most three tasks per invocation unless the human sets a lower explicit limit. The limit bounds unattended work; it does not authorize work beyond the current phase.

## One-task loop

1. Select the next Ready task from the Approved plan.
2. Restate its acceptance criteria briefly.
3. Read only the linked requirements, decisions, architecture sections, code, and tests needed for that task.
4. Implement the smallest coherent change that satisfies the criteria.
5. Add or update tests, including the named failure path.
6. Run the task's required validation using the same commands CI runs.
7. Obtain a fresh-context test review after implementation.
8. Obtain a fresh-context security review only when the plan marks the task or the change touches authentication, data, trust, or secrets.
9. Exercise the running UI when a user can see or click the change.
10. Fix required findings and add regression tests. Stop if a required finding cannot be fixed within the task.
11. Update only the documents the change made false.
12. Update `TASKS.md` and `HANDOFF.md` to match git.
13. Mark the task Done and commit it on the plan branch. Do not merge to `main`.
14. Stop at a completed phase or any stop condition. Otherwise repeat with the next Ready task until the invocation limit.

## Review independence

A reviewer must run in a fresh context that did not implement the change. Give it the task, linked requirements, plan, current diff or SHA, and the relevant role under `agents/`.

If the runtime cannot create a fresh context, perform and label a self-review. Never describe it as independent.

Required findings identify unmet criteria, regressions, exploitable behavior, or missing failure coverage. Style preferences and speculative improvements are not required findings.

## Stop conditions

Stop and return control when:

- The phase is complete.
- The plan is wrong, incomplete, or conflicts with another Approved source.
- A new expensive decision, public contract, migration, dependency, or trust-boundary change is required.
- Required checks remain red and the repair is outside the task.
- The repository does not match the handoff.
- Secrets appear.
- The next work is not authorized by the plan.
- The invocation limit is reached.

Do not redesign the project under the guise of finishing a task.

## Checkpoint report

Return:

1. Tasks completed during this invocation
2. Current branch and SHA
3. Validation commands and exact results
4. Reviews performed and required findings
5. Documents and state files updated
6. The halt reason
7. What the human should inspect next
