# PLAN-000: `[MILESTONE OR FEATURE]`

Status: Draft
Owner: `[YOU]`
Created: `[YYYY-MM-DD]`
Last updated: `[YYYY-MM-DD]`
Roadmap milestone: `[M-00]`
Requirements: `[IDS]`
Decision records: `[IDS]`
Branch: `plan/[M-00-slug]`

Approving this plan authorizes the tasks below. Grok will not ask you to Ready them.

## 1. Outcome

`[WHAT SOMEONE CAN DO WHEN THIS PLAN IS DONE]`

## 2. In / out

In:

- `[IN]`

Out:

- `[OUT — say it so Grok cannot "helpfully" add it]`

## 3. Current state

What the code, data, and env actually do today. Not the wish.

## 4. Target

End-to-end behavior, citing approved requirement IDs. If you need a new Must, stop. That is not a plan problem.

## 5. Surfaces

| Area | Change | Why (requirement or ADR) |
|---|---|---|
| `[PATH]` | `[WHAT]` | `[ID]` |

## 6. Data, interface, security

Delete a bullet if it is none.

- Data / migration: `[NONE OR WHAT]`
- Interface: `[NONE OR WHAT]`
- Trust / auth / sensitive data: `[NONE OR WHAT]`
- Audit: `[NONE OR WHAT]`

## 7. Review policy

Default: tests every task; fresh test review after implement; no review file unless there is a finding.

Also run:

- Security on: `[TASKS THAT TOUCH AUTH, DATA, TRUST, SECRETS — OR NONE]`
- UI exercise on: `[TASKS A USER CAN SEE — OR NONE]`
- Durable `docs/reviews/` record on: `[SECURITY FINDINGS, WAIVERS, RELEASE — OR NONE]`

Do not list every role on every task.

## 8. Phases

Each phase is something you can run or see. 2–4. After each, Grok stops.

### Phase 1: `[NAME]`

You will look at: `[COMMAND, SCREEN, OR DEMO]`

Tasks: `[T-001, T-002]`

Validation: `[COMMAND]`

### Phase 2: `[NAME]`

You will look at: `[…]`

Tasks: `[…]`

Validation: `[…]`

## 9. Tests

The smallest set that would fail if the outcome were fake.

- `[TEST]`

## 10. Deploy / rollback

Delete this section if you are not deploying.

- Deploy: `[…]`
- Rollback: `[…]`

## 11. Stops

Grok must halt and return the plan to you if:

- `[NEW EXPENSIVE DECISION]`
- `[MUST WE CANNOT TEST]`
- `[SCOPE NOT IN SECTION 2]`
- required checks stay red

## 12. Tasks

Write these into `TASKS.md` after the plan is coherent. You still approve the plan, not each row.

| ID | Phase | Outcome | Depends | Extra review | Proof |
|---|---|---|---|---|---|
| T-000 | 1 | `[…]` | None | none | `[COMMAND]` |

## 13. Exit

- [ ] Included Musts have evidence
- [ ] Phase validations passed
- [ ] Known limits written and accepted
- [ ] You can demonstrate the outcome

## 14. Notes

Dated facts only.

- `[YYYY-MM-DD] — [FACT]`

## Approval

| Who | Decision | Date |
|---|---|---|
| You | `[APPROVED / NOT]` | `[DATE]` |
