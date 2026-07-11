# User Journeys and Scenarios

Status: Draft  
Owner: `[PRODUCT OR BUSINESS OWNER]`  
Last reviewed: `[YYYY-MM-DD]`

## How to use this file

User journeys describe how a person, system, or operator tries to reach an outcome. They are discovery tools, not complete requirements. Include normal, alternative, failure, recovery, permission, and support paths.

## Actors

| Actor ID | Actor | Goal | Important characteristics or constraints |
|---|---|---|---|
| ACT-001 | `[ACTOR NAME]` | `[WHAT THEY NEED]` | `[SKILL, ACCESS, DEVICE, LOCATION, OR OTHER FACTOR]` |

## Journey map

| Journey ID | Actor | Trigger | Desired outcome | Priority | Related outcome |
|---|---|---|---|---:|---|
| UJ-001 | ACT-001 | `[TRIGGER]` | `[OUTCOME]` | High | OUT-001 |

---

## UJ-001: `[JOURNEY NAME]`

### Actor and goal

- Actor: `ACT-001 - [NAME]`
- Goal: `[WHAT THE ACTOR IS TRYING TO ACCOMPLISH]`

### Trigger

`[WHAT STARTS THE JOURNEY]`

### Preconditions

- `[WHAT MUST ALREADY BE TRUE]`
- `[REQUIRED ACCESS OR DATA]`

### Main success path

1. `[ACTOR OR SYSTEM ACTION]`
2. `[NEXT ACTION]`
3. `[OBSERVABLE RESULT]`

### Alternative paths

- **A1 - `[NAME]`:** `[WHAT CHANGES AND HOW THE FLOW CONTINUES]`
- **A2 - `[NAME]`:** `[ALTERNATIVE]`

### Failure and recovery paths

- **F1 - `[FAILURE]`:** `[EXPECTED MESSAGE, STATE, RECOVERY, AND AUDIT BEHAVIOR]`
- **F2 - `[FAILURE]`:** `[EXPECTED HANDLING]`

### Permission and privacy considerations

- `[WHO MAY PERFORM WHICH ACTION]`
- `[WHAT INFORMATION MUST NOT BE EXPOSED]`

### Data involved

- Inputs: `[DATA]`
- Outputs: `[DATA]`
- Sensitive data: `[DATA OR NONE]`
- Record or audit needs: `[NEED]`

### Acceptance examples

Write concrete examples that can later become requirements or tests.

- Given `[STARTING STATE]`, when `[ACTION]`, then `[EXPECTED RESULT]`.
- Given `[ERROR CONDITION]`, when `[ACTION]`, then `[EXPECTED SAFE RESULT]`.

### Open questions

- `[QUESTION]`

### Candidate requirements

- `[FR-000 OR TO BE CREATED]`

---

## Journey review checklist

- [ ] Each important user group has at least one journey.
- [ ] Happy paths are not the only paths described.
- [ ] Authorization and privacy are considered.
- [ ] Partial failure and recovery are considered.
- [ ] Operational or administrative journeys are included.
- [ ] Ambiguous terms are added to the glossary.
- [ ] Candidate requirements are not treated as approved until reviewed in `REQUIREMENTS.md`.
