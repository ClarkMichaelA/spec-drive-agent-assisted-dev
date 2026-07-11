# 7. The Implementation Loop

## Goal

Let the AI work with meaningful autonomy while keeping each change bounded, reviewable, and supported by evidence.

## Do not begin with "finish the entire project"

A long autonomous loop can multiply one wrong assumption across many tasks. Context becomes stale, tests may be rationalized, and architecture drift can accumulate.

Start with exactly one Ready task. Later, allow a small batch only when the tasks are low-risk, closely related, and covered by reliable automated checks.

## The standard loop

1. Read the working agreement and documentation index.
2. Read the selected primary-role file under `agents/`, when assigned, and identify the active role.
3. Read the handoff and selected task, then verify actual repository and source-control state.
4. Read linked requirements, decisions, architecture, and active plan.
5. Inspect existing code and tests.
6. Produce a short implementation plan for the task.
7. Implement the smallest coherent change.
8. Add or update tests.
9. Run required checks.
10. Review the full diff against acceptance criteria and constraints.
11. Correct defects found.
12. Update affected documentation, task, review, and handoff state.
13. Stop and report evidence.

## Context control

The AI usually does not need every document in every turn. Give it:

- The working agreement
- The selected role file, when assigned
- The selected task
- Linked requirements
- Relevant decision records
- Relevant architecture section
- Active plan section
- Relevant source code and tests
- Current handoff

This is progressive disclosure: begin with a map and load detailed context only when it is relevant.

## Stop conditions

Instruct the AI to stop and report when:

- Approved sources conflict
- A high-impact requirement is missing or ambiguous
- A new consequential design decision is required
- A production dependency or public contract would change
- A migration or destructive action was not approved
- Required validation fails and cannot be corrected within task scope
- The repository state differs materially from the handoff
- A secret or sensitive-data problem is found
- The task cannot be completed without expanding scope

## Autonomy levels

### Green: proceed

- Implement an approved Ready task
- Add tests
- Correct a clear local defect
- Refactor without changing external behavior
- Update documentation to match approved behavior

### Yellow: propose before acting

- New production dependency
- Public interface change
- Schema or data migration
- Authentication, authorization, or trust-boundary change
- Architecture deviation
- Broad scope expansion

### Red: explicit current authorization required

- Production deployment
- Destructive real-data operation
- Secret use or rotation
- Permission escalation
- Disabling controls
- Irreversible migration
- External communication or purchase

## Copy-ready one-task implementation prompt

```text
Act as the Software Engineer role defined in agents/software-engineer.md.
Read AGENTS.md, docs/INDEX.md, the role file, HANDOFF.md, and TASKS.md. Select
task [T-000], which is already marked Ready with Software Engineer as its
primary role. Read only its linked requirements, decision records, architecture
sections, active plan, source files, and tests.

Complete exactly this one task.

Required workflow:
1. Verify repository state and task dependencies.
2. Give a short implementation plan tied to the acceptance criteria.
3. Implement the smallest coherent change within scope.
4. Add or update tests for success, important boundary, and failure behavior.
5. Run every validation command required for this task.
6. Review the complete diff for correctness, security, compatibility,
   unnecessary complexity, and documentation drift.
7. Correct issues found within scope.
8. Update TASKS.md, HANDOFF.md, and only the other documents genuinely affected.
9. Stop after this task.

Do not:
- Invent missing requirements or external facts.
- Expand scope.
- introduce a consequential decision without proposing it for approval.
- Claim a check passed unless it actually ran and passed.

Final report:
- Completed changes
- Files modified
- Tests/checks and exact results
- Remaining limitations, risks, or assumptions
- State-file updates
- Recommended next task or review action
```

If the task names a different primary role, select that role explicitly and use its permitted outputs and boundaries. Do not switch roles silently.

## Independent review

For medium- or high-risk changes, select the required reviewer role and use a fresh AI context after implementation. Give it the role file, task, requirements, design, exact revision, and diff. Ask it to record evidence-based findings under `docs/reviews/` rather than praise the work.

Changing from Software Engineer to Test Engineer within the same assistant context can improve self-review, but it does not make the review independent. Label it as self-review or non-independent review.

Review for:

- Acceptance-criteria gaps
- Incorrect assumptions
- Security and permission defects
- Error and recovery behavior
- Data integrity
- Concurrency and idempotency
- Compatibility and migration safety
- Weak tests
- Excessive complexity
- Documentation drift

## Batching later

Once the process is stable, a safe bounded batch might be:

```text
Complete up to three Ready tasks from the same milestone. They must share the
same approved plan, require no new decision, and pass full validation after
each task. Stop on the first failure, ambiguity, conflict, or scope change.
```

Do not use batching merely to reduce the number of prompts. The goal is lower supervision without lower control.
