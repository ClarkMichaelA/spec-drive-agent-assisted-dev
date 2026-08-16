# Task Queue

Status: Active
Last reviewed: `[YYYY-MM-DD]`
Current milestone: `[M-00]`
Current plan: `[docs/plans/active/PLAN-000-name.md]`
Plan branch: `[plan/M-00-slug OR NONE]`

This is fuel for `/work-plan`. It is not a product backlog and not a place a human lives.

The Approved plan authorizes these tasks. Grok keeps statuses honest. Do not invent a Ready ceremony.

## Status

- **Backlog** — in a later phase, or waiting on a dependency
- **Ready** — plan authorized it, dependencies Done, criteria testable. Agent-checked.
- **In Progress** — being implemented. One at a time.
- **Blocked** — stop reason written
- **In Review** — waiting on a required fresh review
- **Done** — true on the plan branch. Not necessarily merged to `v1`.
- **Deferred** / **Cancelled** — with a reason

## Queue

| ID | Status | Phase | Summary | Depends on | Requirement(s) |
|---|---|---|---|---|---|
| T-001 | Backlog | 1 | `[FIRST TASK]` | None | `[FR-001]` |

---

## T-000: `[OUTCOME]`

**Status:** Backlog
**Phase:** `[1]`
**Milestone:** `[M-00]`
**Requirements:** `[FR-000]`
**Decisions:** `[ADR-0000 OR NONE]`
**Plan:** `[PATH]`
**Depends on:** `[T-IDS OR NONE]`
**Primary role:** Software Engineer
**Extra reviews:** `[security | ui | none]` — inherit from the plan unless this task is special

### Objective

One sentence. What will be true.

### Scope

- `[IN]`

### Out of scope

- `[OUT — including the next task]`

### Acceptance criteria

- [ ] `[OBSERVABLE]`
- [ ] `[FAILURE / BOUNDARY IF THIS TASK OWNS IT]`

### Validation

```text
[COMMAND]
```

### Risks

- `[NONE OR THE THING THAT MAKES THIS NOT A LOCAL CHANGE]`

### Completion

Done on: `[DATE]`
SHA: `[SHA]`
Validation: `[COMMAND — RESULT]`

---

## Rules

- Do not mark Ready if an expensive question is open. That is a plan problem.
- Do not mark Done because code exists.
- Do not mark Done because it merged. Merge is a phase.
- New work is a new task or a plan change, not scope creep on T-000.
