# Requirements Specification: `[PROJECT NAME]`

Status: Draft  
Owner: `[PRODUCT OR REQUIREMENTS OWNER]`  
Technical reviewer: `[NAME OR ROLE]`  
Last reviewed: `[YYYY-MM-DD]`

## How to use this file

This document states what must be true for the project to succeed. Requirements should be clear, necessary, feasible, testable, and traceable. They should not prescribe an implementation unless the implementation itself is an external constraint.

## Requirement ID scheme

- `FR-###` - functional behavior
- `NFR-###` - quality attribute or measurable nonfunctional requirement
- `SEC-###` - security or privacy requirement
- `DATA-###` - data integrity, lifecycle, retention, or migration requirement
- `OPS-###` - deployment, monitoring, recovery, and support requirement
- `INT-###` - external interface or integration requirement
- `CON-###` - inherited constraint, normally originating in `PROJECT.md`

Do not reuse an identifier after a requirement is removed. Mark it superseded or cancelled and explain why.

## Requirement summary

| ID | Title | Priority | Status | Source | Verification method |
|---|---|---:|---|---|---|
| FR-001 | `[SHORT TITLE]` | Must | Draft | UJ-001 | Automated test |

Priority may use `Must`, `Should`, `Could`, and `Not now`, or another explicitly defined scheme.

---

## FR-001: `[FUNCTIONAL REQUIREMENT TITLE]`

**Status:** Draft  
**Priority:** Must  
**Source:** `[OUTCOME, JOURNEY, POLICY, INTERVIEW, OR OTHER SOURCE]`  
**Owner:** `[OWNER]`

### Requirement

The system shall `[ONE OBSERVABLE BEHAVIOR]`.

### Rationale

`[WHY THIS REQUIREMENT EXISTS]`

### Acceptance criteria

- [ ] Given `[STATE]`, when `[ACTION]`, then `[RESULT]`.
- [ ] Given `[ALTERNATIVE OR ERROR STATE]`, when `[ACTION]`, then `[SAFE AND USEFUL RESULT]`.

### Boundaries and exceptions

- `[LIMIT, EXCEPTION, OR OUT-OF-SCOPE CONDITION]`

### Dependencies

- `[OTHER REQUIREMENT, EXTERNAL SYSTEM, OR NONE]`

### Verification

- Method: `[AUTOMATED TEST | INSPECTION | DEMONSTRATION | ANALYSIS | MANUAL TEST]`
- Evidence: `[TEST, REPORT, REVIEW RECORD, OR OTHER EVIDENCE]`

---

## Quality attributes

Quality requirements must be measurable or otherwise objectively verifiable. Replace vague words such as "fast," "secure," "reliable," and "easy" with conditions and evidence.

### NFR-001: `[QUALITY ATTRIBUTE TITLE]`

**Attribute:** `[PERFORMANCE | AVAILABILITY | USABILITY | MAINTAINABILITY | COMPATIBILITY | OTHER]`

The system shall `[MEASURABLE CONDITION]` when `[DEFINED LOAD, ENVIRONMENT, OR SCENARIO]`.

Verification:

- `[MEASUREMENT OR TEST METHOD]`

## Security and privacy requirements

### SEC-001: `[TITLE]`

The system shall `[CONTROL OR PROTECTION STATED AS TESTABLE BEHAVIOR]`.

Verification:

- `[TEST, INSPECTION, OR AUDIT EVIDENCE]`

## Data requirements

### DATA-001: `[TITLE]`

The system shall `[INTEGRITY, RETENTION, CLASSIFICATION, OWNERSHIP, OR MIGRATION CONDITION]`.

## Operational requirements

### OPS-001: `[TITLE]`

The system shall `[DEPLOYMENT, MONITORING, BACKUP, RESTORE, SUPPORT, OR RECOVERY CONDITION]`.

## Integration requirements

### INT-001: `[TITLE]`

The system shall `[INTERFACE BEHAVIOR]` when interacting with `[SYSTEM OR ACTOR]`.

Document assumptions such as rate limits, availability, schemas, and credentials only after verifying them with an authoritative source.

## Exclusions

The following are explicitly not requirements for the current approved scope:

- `[EXCLUDED CAPABILITY]`

## Requirement quality review

Before approval, confirm:

- [ ] Each requirement has one main idea.
- [ ] Each requirement uses clear terms defined in the glossary when needed.
- [ ] Each requirement is testable or has a stated verification method.
- [ ] Requirements do not conflict.
- [ ] Error, recovery, security, data, and operational needs are represented.
- [ ] No design choice is disguised as a requirement without a real constraint.
- [ ] Sources and owners are recorded.
- [ ] Unknown facts remain marked as unknown rather than guessed.

## Approval

| Role | Name | Decision | Date | Notes |
|---|---|---|---|---|
| Product or business owner | `[NAME]` | `[APPROVED/CHANGES REQUESTED]` | `[DATE]` | `[NOTES]` |
| Technical owner | `[NAME]` | `[APPROVED/CHANGES REQUESTED]` | `[DATE]` | `[NOTES]` |
| Security or risk reviewer, if required | `[NAME]` | `[DECISION]` | `[DATE]` | `[NOTES]` |
