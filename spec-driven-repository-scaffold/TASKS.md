# Task Queue

Status: Active
Last reviewed: `[YYYY-MM-DD]`
Current milestone: `[MILESTONE ID AND NAME]`

This file is the executable work queue. It is not a wish list, design document, or substitute for requirements.

## Status definitions

- **Backlog** - worthwhile but not yet prepared for implementation.
- **Ready** - fully understood and safe to select.
- **In Progress** - actively being implemented; normally only one task per contributor or agent.
- **Blocked** - cannot proceed; the blocker is stated.
- **In Review** - implementation is complete and awaiting review or approval.
- **Done** - acceptance criteria and validation are complete.
- **Deferred** - intentionally postponed with a reason.
- **Cancelled** - no longer required, with a reason.

## Current queue

| ID | Status | Priority | Milestone | Summary | Depends on | Requirement(s) |
|---|---|---:|---|---|---|---|
| T-001 | Backlog | 1 | M-01 | `[FIRST TASK]` | None | `[FR-001]` |

## Task template

Copy this section for each task. Keep tasks small, coherent, and independently verifiable.

---

## T-000: `[ACTION-ORIENTED TASK TITLE]`

**Status:** Backlog  
**Priority:** `[1-5]`  
**Milestone:** `[M-00]`  
**Requirements:** `[FR-000, NFR-000]`  
**Architecture:** `[ARCHITECTURE.md SECTION]`  
**Decisions:** `[ADR-0000 OR NONE]`  
**Plan:** `[PATH TO ACTIVE PLAN]`  
**Depends on:** `[TASK IDS OR NONE]`  
**Owner:** `[NAME, ROLE, OR UNASSIGNED]`

### Objective

State one concrete outcome. Explain what will be true when this task is complete.

### Why this task exists

Explain the requirement, risk, or milestone outcome this task supports.

### Scope

- `[INCLUDED CHANGE]`
- `[INCLUDED CHANGE]`

### Out of scope

- `[EXCLUDED CHANGE]`
- `[FOLLOW-UP WORK THAT MUST NOT BE PULLED INTO THIS TASK]`

### Acceptance criteria

Use observable statements.

- [ ] `[BEHAVIOR OR RESULT THAT CAN BE VERIFIED]`
- [ ] `[ERROR OR ALTERNATIVE PATH]`
- [ ] `[SECURITY, DATA, OR OPERATIONAL CRITERION IF RELEVANT]`
- [ ] `[DOCUMENTATION OR COMPATIBILITY CRITERION IF RELEVANT]`

### Implementation notes

Optional guidance, not a replacement for the approved architecture. Avoid prescribing unnecessary line-by-line code.

### Validation

```text
[COMMAND OR MANUAL CHECK]
[COMMAND OR MANUAL CHECK]
```

Expected evidence:

- `[PASSING TEST OR OBSERVABLE RESULT]`
- `[LOG, SCREENSHOT, REPORT, OR OTHER EVIDENCE IF NEEDED]`

### Risks and rollback

- Risk: `[RISK OR NONE]`
- Rollback or recovery: `[APPROACH OR NOT APPLICABLE]`

### Completion record

Completed on: `[YYYY-MM-DD]`  
Completed by: `[NAME OR ASSISTANT LABEL]`  
Validation result: `[SUMMARY]`  
Related change reference: `[COMMIT, REVIEW, OR RELEASE REFERENCE]`

---

## Queue maintenance rules

- Only `Ready` tasks may be selected automatically.
- Do not mark a task `Ready` while a high-impact question remains unresolved.
- Do not mark a task `Done` solely because code was produced.
- When new work is discovered, add a separate task rather than silently expanding the current one.
- When a task changes an approved requirement or design, obtain the appropriate review before implementation continues.
