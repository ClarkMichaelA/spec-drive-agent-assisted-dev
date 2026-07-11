# Interface and API Specification

Status: Draft  
Owner: `[TECHNICAL OWNER]`  
Last reviewed: `[YYYY-MM-DD]`

Use this file for interfaces the project exposes or consumes. "API" may mean an HTTP interface, message, event, file exchange, command, or other contract.

## 1. Interface principles

- Contracts are explicit and versioned when compatibility matters.
- Inputs are validated at trust boundaries.
- Errors are useful to authorized callers without exposing sensitive detail.
- Retryable operations are designed for duplicate delivery when applicable.
- External facts such as schemas, limits, and authentication methods are verified from authoritative sources.

## 2. Interface inventory

| ID | Name | Direction | Consumer/provider | Purpose | Contract location | Related requirements |
|---|---|---|---|---|---|---|
| API-001 | `[NAME]` | Inbound/Outbound | `[PARTIES]` | `[PURPOSE]` | `[PATH OR DOCUMENT]` | `[IDS]` |

## 3. Common conventions

- Authentication: `[METHOD]`
- Authorization: `[METHOD]`
- Transport and encryption: `[METHOD]`
- Data format: `[FORMAT]`
- Date and time: `[FORMAT AND TIME-ZONE RULE]`
- Identifiers: `[RULE]`
- Pagination: `[RULE OR N/A]`
- Correlation: `[RULE]`
- Idempotency: `[RULE OR N/A]`
- Timeout and retry: `[RULE]`
- Versioning and compatibility: `[RULE]`

## 4. Interface detail template

### API-001: `[INTERFACE NAME]`

**Purpose:** `[PURPOSE]`  
**Direction:** `[INBOUND/OUTBOUND]`  
**Owner:** `[OWNER]`  
**Related requirements:** `[IDS]`

#### Request, message, file, or command

```text
[EXAMPLE STRUCTURE WITH NON-SENSITIVE SAMPLE VALUES]
```

Field rules:

| Field | Required? | Meaning | Validation | Sensitive? |
|---|---|---|---|---|
| `[FIELD]` | Yes/No | `[MEANING]` | `[RULE]` | Yes/No |

#### Successful result

```text
[EXAMPLE]
```

#### Errors and recovery

| Condition | Result | Retryable? | Caller action | Logged or audited? |
|---|---|---|---|---|
| `[CONDITION]` | `[ERROR/STATUS]` | Yes/No | `[ACTION]` | Yes/No |

#### Compatibility

- Current version: `[VERSION]`
- Breaking-change policy: `[POLICY]`
- Deprecation policy: `[POLICY]`

#### Verification

- Contract tests: `[TESTS]`
- Integration environment: `[ENVIRONMENT]`
- Known limitations: `[LIMITS]`
