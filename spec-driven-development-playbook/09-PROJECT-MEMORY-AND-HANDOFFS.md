# 9. Project Memory and Handoffs

## The repository is the memory

Chat context can disappear, become too long, or mix old and new assumptions. Durable project knowledge belongs in versioned files and tests.

Use different artifacts for different kinds of memory:

- `PROJECT.md` - stable intent and scope
- `REQUIREMENTS.md` - approved behavior and quality
- Decision records - why consequential choices were made
- `ARCHITECTURE.md` - current accepted design
- Active plan - how current work will be delivered
- `agents/` - portable specialized role responsibilities and boundaries
- `TASKS.md` - executable queue and status
- Tests - machine-checkable behavior
- `docs/reviews/` - durable review scope, evidence, findings, disposition, and reverification
- `HANDOFF.md` - current operational state
- `CHANGELOG.md` - observable release changes

## What belongs in a handoff

A handoff should answer:

- What was completed?
- What is in progress?
- What revision or branch is current?
- Which validation ran and what happened?
- What is broken or incomplete?
- Which decisions or assumptions were added?
- What is the safest next task?
- What environment detail is needed to resume?
- Which primary role is active, which review role is next, and where is its review record?

It should not become a long project history. Source control, completed plans, and review records serve that purpose.

## Always verify the handoff

A handoff may be stale. At the start of a session, verify:

- Current branch or workspace
- Revision
- Uncommitted changes
- Task states
- Relevant code and tests
- Whether referenced validation still applies

## End every work session cleanly

The assistant should update durable state before stopping. Use this standing instruction:

```text
At the end of every work session, update the project handoff with:
- Completed changes
- Files modified
- Tests and checks run, including exact results
- Remaining issues, risks, assumptions, or blockers
- Current task status
- Current primary role, required next review, and related review record
- Recommended next task or next review action

Verify the handoff against the actual repository. Do not include secrets. Do
not claim completion or passing validation without evidence.
```

## Resume prompt

```text
Read AGENTS.md, docs/INDEX.md, HANDOFF.md, and TASKS.md. If the current task
selects a role, read its file under agents/ and identify the role before
continuing. Verify the handoff against the current repository state, revision,
uncommitted changes, relevant source files, tests, and review records.

Report:
1. Confirmed current state
2. Any mismatch between the handoff and repository
3. The highest-priority Ready task whose dependencies are complete
4. Required context for that task
5. Primary role and any required review roles
6. Any blocker that should be resolved before implementation

Do not change files in this step.
```

## Keep documentation load small

Do not paste the entire project into every prompt. Let the index and links guide the assistant to the relevant documents. This reduces distraction and makes contradictions easier to detect.

## Source control is part of memory

Good commits or change records preserve:

- What changed
- Why it changed
- The related task or requirement
- Validation performed

Do not rely on `CHANGELOG.md` to replace engineering history. The changelog is for users and operators.

## Parallel work caution

One shared `HANDOFF.md` can become a conflict point when several branches or agents work at once. At that stage, use:

- One active plan per workstream
- Branch- or feature-specific handoffs
- A shared issue tracker for authoritative task state
- Clear file ownership and integration points
- A final integration handoff after merging
