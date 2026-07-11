# Change Control for Approved Project Artifacts

Status: Active  
Owner: `[OWNER]`  
Last reviewed: `[YYYY-MM-DD]`

This process keeps the project adaptable without allowing requirements, scope, or architecture to drift invisibly.

## Changes that normally require explicit review

- Adding, removing, or materially changing an approved Must requirement
- Changing success measures, scope, or non-goals
- Changing a public interface or user workflow
- Introducing a consequential architecture choice
- Changing security, privacy, data retention, or trust boundaries
- Changing a production migration or rollback approach
- Moving major scope into or out of a committed milestone

## Change proposal template

### CR-000: `[CHANGE TITLE]`

- Requested by: `[NAME/ROLE]`
- Date: `[DATE]`
- Affected artifacts: `[FILES AND IDS]`
- Current state: `[WHAT IS CURRENTLY APPROVED]`
- Proposed state: `[WHAT WOULD CHANGE]`
- Reason: `[WHY]`
- Options considered: `[OPTIONS]`
- Impact on scope, schedule, cost, risk, security, data, and operations: `[IMPACT]`
- Recommendation: `[RECOMMENDATION]`
- Approver(s): `[ROLES]`
- Decision: `[APPROVED/REJECTED/DEFERRED]`
- Follow-up tasks and decision records: `[IDS]`

## Change procedure

1. Identify the conflict, discovery, or requested outcome.
2. Do not silently change code or documents to hide the difference.
3. List affected requirements, decisions, architecture sections, plans, tasks, tests, and release claims.
4. Evaluate options and consequences.
5. Obtain approval from the appropriate owner.
6. Update all affected artifacts in one coherent change or clearly linked changes.
7. Re-run validation and update traceability.

Minor corrections that do not change meaning, such as spelling or broken links, do not require formal approval.
