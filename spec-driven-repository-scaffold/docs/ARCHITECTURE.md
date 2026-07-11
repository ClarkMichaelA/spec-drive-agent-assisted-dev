# Architecture: `[PROJECT NAME]`

Status: Draft  
Owner: `[TECHNICAL OWNER]`  
Last reviewed: `[YYYY-MM-DD]`

## How to use this file

This document describes the current accepted design. It should explain enough for implementation, review, operations, security analysis, and future change. Record the reason for consequential choices in separate decision records under `decisions/`.

## 1. Architecture summary

`[A SHORT PLAIN-LANGUAGE DESCRIPTION OF THE SYSTEM AND ITS MAJOR PARTS.]`

## 2. Architecture drivers

List the requirements and constraints that materially shape the design.

- `[FR-001: DRIVER]`
- `[NFR-001: DRIVER]`
- `[SEC-001: DRIVER]`
- `[CON-001: DRIVER]`

## 3. System context

### Users and external systems

| Actor or system | Relationship | Data exchanged | Trust level |
|---|---|---|---|
| `[ACTOR/SYSTEM]` | `[HOW IT INTERACTS]` | `[DATA]` | `[TRUST DESCRIPTION]` |

### Context diagram

Add a simple diagram or text representation. Label trust boundaries and external dependencies.

```text
[USER] --> [SYSTEM] --> [EXTERNAL SERVICE]
                 |
                 +--> [DATA STORE]
```

## 4. Major components

| Component | Responsibility | Owns data? | Exposes or consumes interfaces | Related requirements |
|---|---|---|---|---|
| `[COMPONENT]` | `[SINGLE MAIN RESPONSIBILITY]` | `[YES/NO; WHAT DATA]` | `[INTERFACES]` | `[IDS]` |

## 5. Main data and control flows

### Flow F-001: `[NAME]`

1. `[STEP]`
2. `[STEP]`
3. `[RESULT]`

Failure behavior:

- `[WHAT HAPPENS ON TIMEOUT, INVALID DATA, PARTIAL FAILURE, OR UNAVAILABLE DEPENDENCY]`

## 6. Data architecture

Summarize the data model and link to `DATA_MODEL.md`.

- System of record: `[SYSTEM OR COMPONENT]`
- Data ownership: `[OWNER]`
- Consistency model: `[MODEL]`
- Sensitive data: `[CLASSIFICATION OR NONE]`
- Retention and deletion: `[RULE OR LINK]`
- Migration approach: `[APPROACH OR NOT APPLICABLE]`

## 7. Interfaces

Summarize internal and external interfaces and link to `API.md` when applicable.

- `[INTERFACE NAME, PURPOSE, DIRECTION, AND CONTRACT LOCATION]`

## 8. Security and trust boundaries

Link to `SECURITY.md` and summarize:

- Identity source: `[SOURCE]`
- Authentication: `[APPROACH]`
- Authorization: `[APPROACH]`
- Trust boundaries: `[BOUNDARIES]`
- Secret management: `[APPROACH]`
- Audit events: `[EVENTS]`

## 9. Deployment view

| Environment | Purpose | Main components | Data classification | Access |
|---|---|---|---|---|
| Local | Development | `[COMPONENTS]` | `[CLASSIFICATION]` | `[ACCESS]` |
| Test | Automated and manual testing | `[COMPONENTS]` | `[CLASSIFICATION]` | `[ACCESS]` |
| Production | Live service | `[COMPONENTS]` | `[CLASSIFICATION]` | `[ACCESS]` |

Describe network boundaries, runtime placement, scaling, configuration, and release units.

## 10. Reliability and failure handling

- Availability target: `[LINK TO NFR OR TBD]`
- Dependency failures: `[HANDLING]`
- Retry and timeout policy: `[POLICY]`
- Idempotency: `[APPROACH]`
- Data recovery: `[APPROACH]`
- Degraded operation: `[APPROACH]`

## 11. Observability and support

- Logs: `[WHAT, WHERE, SENSITIVITY RULES]`
- Metrics: `[KEY METRICS]`
- Traces: `[APPROACH OR N/A]`
- Alerts: `[ACTIONABLE CONDITIONS]`
- Health checks: `[APPROACH]`
- Support ownership: `[ROLE OR TEAM]`

## 12. Performance and capacity

- Workload assumptions: `[VERIFIED ASSUMPTIONS OR TBD]`
- Capacity boundaries: `[LIMITS]`
- Performance tests: `[LINK OR METHOD]`
- Scaling approach: `[APPROACH]`

## 13. Decisions and tradeoffs

| Decision | Record | Consequence |
|---|---|---|
| `[DECISION]` | `ADR-0000` | `[TRADEOFF]` |

## 14. Known gaps and technical debt

- `[GAP, EFFECT, AND PLANNED TREATMENT]`

## 15. Requirements mapping

| Architecture section or component | Requirements satisfied |
|---|---|
| `[COMPONENT OR SECTION]` | `[FR-001, NFR-001]` |

## Architecture review checklist

- [ ] Every major component has a clear responsibility.
- [ ] Important data flows and failure paths are described.
- [ ] Trust boundaries and sensitive data are visible.
- [ ] Deployment, operations, monitoring, backup, and rollback are considered.
- [ ] Difficult-to-reverse choices have decision records.
- [ ] The design traces to approved requirements.
- [ ] The design is no more complex than the requirements justify.
