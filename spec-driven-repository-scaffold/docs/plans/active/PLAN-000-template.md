# PLAN-000: `[MILESTONE OR FEATURE NAME]`

Status: Draft  
Owner: `[OWNER]`  
Created: `[YYYY-MM-DD]`  
Last updated: `[YYYY-MM-DD]`  
Roadmap milestone: `[M-00]`  
Requirements: `[IDS]`  
Decision records: `[IDS]`

## 1. Outcome

`[WHAT USABLE OR RISK-REDUCING RESULT THIS PLAN WILL DELIVER]`

## 2. Scope

Included:

- `[INCLUDED WORK]`

Not included:

- `[EXCLUDED WORK]`

## 3. Current state

Describe the relevant code, data, interfaces, environment, and known limitations as they actually exist.

## 4. Target behavior

Describe the end-to-end behavior after the plan is complete. Reference approved requirements instead of silently changing them.

## 5. Components and files likely affected

| Area | Expected change | Reason |
|---|---|---|
| `[COMPONENT/PATH]` | `[CHANGE]` | `[REQUIREMENT OR DESIGN REASON]` |

## 6. Data and interface changes

- Data model or migration: `[CHANGE OR NONE]`
- External or internal interface: `[CHANGE OR NONE]`
- Compatibility approach: `[APPROACH]`
- Idempotency and retry: `[APPROACH]`

## 7. Security, privacy, and permissions

- Trust-boundary changes: `[CHANGE OR NONE]`
- Authentication or authorization: `[CHANGE OR NONE]`
- Sensitive data: `[HANDLING]`
- Audit events: `[EVENTS]`
- Required review: `[ROLE OR NONE]`

## 8. Implementation phases

### Phase 1: `[NAME]`

Outcome:

`[RESULT]`

Work:

- `[WORK ITEM]`

Validation:

- `[CHECK]`

### Phase 2: `[NAME]`

Outcome:

`[RESULT]`

Work:

- `[WORK ITEM]`

Validation:

- `[CHECK]`

## 9. Test approach

- Unit: `[TESTS]`
- Component or integration: `[TESTS]`
- End-to-end: `[TESTS]`
- Security and permissions: `[TESTS]`
- Nonfunctional: `[TESTS OR N/A]`
- Manual demonstration: `[DEMO]`

## 10. Deployment, migration, and rollback

- Deployment sequence: `[SEQUENCE]`
- Feature flag or gradual rollout: `[APPROACH OR N/A]`
- Migration: `[APPROACH OR N/A]`
- Rollback or forward-fix: `[APPROACH]`
- Post-deployment checks: `[CHECKS]`

## 11. Observability and support

- Logs: `[CHANGES]`
- Metrics: `[CHANGES]`
- Alerts: `[CHANGES]`
- Runbooks or support notes: `[CHANGES]`

## 12. Risks, assumptions, and open questions

| Type | ID or description | Treatment | Owner | Needed by |
|---|---|---|---|---|
| Risk | `[R-000 OR DESCRIPTION]` | `[ACTION]` | `[OWNER]` | `[DATE/PHASE]` |
| Assumption | `[A-000 OR DESCRIPTION]` | `[VALIDATION]` | `[OWNER]` | `[DATE/PHASE]` |
| Question | `[QUESTION]` | `[DECISION NEEDED]` | `[OWNER]` | `[DATE/PHASE]` |

## 13. Task breakdown

Create tasks in `TASKS.md` only after the plan is coherent.

| Proposed task | Outcome | Dependencies | Verification |
|---|---|---|---|
| `[T-000 TITLE]` | `[RESULT]` | `[DEPENDENCIES]` | `[CHECK]` |

## 14. Exit criteria

- [ ] All included requirements have evidence.
- [ ] Required quality and security gates pass.
- [ ] Deployment and rollback are understood and tested as required.
- [ ] Documentation and support material are current.
- [ ] Known limitations are accepted and visible.
- [ ] The milestone outcome can be demonstrated.

## 15. Progress notes

Use dated, factual notes. Do not replace task tracking with a narrative diary.

- `[YYYY-MM-DD] - [FACTUAL UPDATE]`

## Approval

| Role | Name | Decision | Date | Notes |
|---|---|---|---|---|
| Product owner | `[NAME]` | `[DECISION]` | `[DATE]` | `[NOTES]` |
| Technical owner | `[NAME]` | `[DECISION]` | `[DATE]` | `[NOTES]` |
| Security/operations reviewer, if needed | `[NAME]` | `[DECISION]` | `[DATE]` | `[NOTES]` |
