# Data Model and Lifecycle

Status: Draft  
Owner: `[DATA OR TECHNICAL OWNER]`  
Last reviewed: `[YYYY-MM-DD]`

Use this file when the project creates, stores, transforms, or synchronizes meaningful data. Do not invent fields or retention rules; confirm them with domain owners and authoritative sources.

## 1. Data principles

- `[EXAMPLE: ONE CLEAR SYSTEM OF RECORD FOR EACH ENTITY]`
- `[EXAMPLE: COLLECT ONLY DATA REQUIRED BY APPROVED REQUIREMENTS]`

## 2. Conceptual entities

| Entity | Plain meaning | Owner | System of record | Sensitive? | Retention |
|---|---|---|---|---|---|
| `[ENTITY]` | `[MEANING]` | `[OWNER]` | `[SYSTEM]` | `[YES/NO; CLASS]` | `[RULE OR TBD]` |

## 3. Relationships

```text
[ENTITY A] 1 ---- many [ENTITY B]
```

Explain optionality, ownership, and deletion behavior.

## 4. Key fields and rules

### `[ENTITY NAME]`

| Field | Meaning | Type or format | Required? | Source | Validation | Sensitive? |
|---|---|---|---|---|---|---|
| `[FIELD]` | `[MEANING]` | `[TYPE]` | Yes/No | `[SOURCE]` | `[RULE]` | Yes/No |

Business rules:

- `[UNIQUENESS, STATE, CALCULATION, OR INTEGRITY RULE]`

## 5. Data lifecycle

For each important entity, describe:

1. Creation or ingestion
2. Validation
3. Use and updates
4. Audit or history
5. Retention
6. Archival, anonymization, or deletion
7. Recovery

## 6. Synchronization and consistency

- Authoritative source: `[SOURCE]`
- Synchronization direction: `[DIRECTION]`
- Frequency or trigger: `[FREQUENCY]`
- Duplicate handling: `[RULE]`
- Conflict handling: `[RULE]`
- Idempotency: `[APPROACH]`
- Reconciliation: `[METHOD]`

## 7. Migration approach

- Existing source: `[SOURCE OR N/A]`
- Mapping: `[LINK OR SUMMARY]`
- Validation and reconciliation: `[METHOD]`
- Cutover: `[APPROACH]`
- Rollback or forward-fix: `[APPROACH]`
- Data owner sign-off: `[OWNER]`

## 8. Data-quality checks

| Check | Frequency | Failure action | Owner |
|---|---|---|---|
| `[CHECK]` | `[FREQUENCY]` | `[ACTION]` | `[OWNER]` |
