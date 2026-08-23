# Documentation Index

Status: Draft
Owner: `[OWNER]`
Last reviewed: `[YYYY-MM-DD]`

A map. If the coding agent has to read every file, this page failed.

## Read first

1. `PROJECT.md` — why
2. `REQUIREMENTS.md` — what must be true
3. `ARCHITECTURE.md` — shape
4. `ROADMAP.md` — order of outcomes
5. The Approved plan in `plans/active/` — what the coding agent is allowed to do now
6. `WORK_PLAN.md` — how an Approved plan is executed
7. `../TASKS.md` — fuel
8. `../HANDOFF.md` — now (verify against git)

Journeys before requirements if you are still discovering. Role file under `../agents/` if one is selected.

## Who owns which question

| Question | File |
| --- | --- |
| Why does this exist? | `PROJECT.md` |
| How do people try? | `user_journeys/` |
| What must be true? | `REQUIREMENTS.md` |
| Why that expensive choice? | `decisions/` |
| What is the shape? | `ARCHITECTURE.md` |
| Which outcome first? | `ROADMAP.md` |
| How is this milestone built? | `plans/active/` |
| How is an Approved plan executed? | `WORK_PLAN.md` |
| What is the next task? | `../TASKS.md` |
| What is true right now? | `../HANDOFF.md` |
| Security? | `SECURITY.md` if you need a separate file |
| How does it run? | `OPERATIONS.md` if you need a separate file |
| How do we prove it? | `TEST_STRATEGY.md` if the plan is not enough |
| Data? | `DATA_MODEL.md` if the domain is big enough |
| Interfaces? | `API.md` if you expose or consume one |
| Risks / guesses? | `RISKS.md` / `ASSUMPTIONS.md` |
| Trace? | `TRACEABILITY.md` — optional, generate it if you must |

## Active

- Plan: `[docs/plans/active/PLAN-000-name.md]`
- Milestone: `[M-00]`
- Branch: `[plan/M-00-slug]`

## Delete if unused

`API.md`, `DATA_MODEL.md`, separate `SECURITY.md` / `OPERATIONS.md` / `TEST_STRATEGY.md`, `TRACEABILITY.md`.

A file that answers no question is a liability.
