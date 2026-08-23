# User Journeys and Scenarios

Status: Draft  
Owner: `[PRODUCT OR BUSINESS OWNER]`  
Last reviewed: `[YYYY-MM-DD]`

This directory holds one file per user journey, matching the pattern used by `decisions/`, `plans/`, and `reviews/`. This README is the **index**: actors, the journey map, naming rules, and the review checklist.

## How to use this directory

User journeys describe how a person, system, or operator tries to reach an outcome. They are discovery tools, not complete requirements. Include normal, alternative, failure, recovery, permission, and support paths.

Write each detailed journey as its own file in this directory, starting from `UJ-001-template.md`. Keep the actor inventory and journey map current in this README.

## When to create a journey file

Create one when a person, system, or operator needs a distinct path to an outcome. Include normal, alternative, failure, recovery, permission, and support paths—not only the happy path.

Include administrative and support journeys, not only end-user journeys.

## Naming

```text
UJ-001-short-descriptive-title.md
UJ-002-short-descriptive-title.md
```

Use the next available number. Do not reuse numbers. Start from the template:

```text
UJ-001-template.md
```

## Workflow

1. Copy `UJ-001-template.md` to a new numbered file.
2. Fill in actor, trigger, paths, data, and acceptance examples.
3. Register the journey in the journey map below.
4. Link candidate requirements back to the journey ID after requirements review.

## Actors

| Actor ID | Actor | Goal | Important characteristics or constraints |
|---|---|---|---|
| ACT-001 | `[ACTOR NAME]` | `[WHAT THEY NEED]` | `[SKILL, ACCESS, DEVICE, LOCATION, OR OTHER FACTOR]` |

## Journey map

| Journey ID | Actor | Trigger | Desired outcome | Priority | Related outcome | Detail |
|---|---|---|---|---:|---|---|
| UJ-001 | ACT-001 | `[TRIGGER]` | `[OUTCOME]` | High | OUT-001 | [UJ-001-template.md](UJ-001-template.md) |

Add a row here whenever you create a new journey file. Use stable IDs (`UJ-001`, `UJ-002`, …) and link to the corresponding file in this directory.

## Journey review checklist

- [ ] Each important user group has at least one journey.
- [ ] Happy paths are not the only paths described.
- [ ] Authorization and privacy are considered.
- [ ] Partial failure and recovery are considered.
- [ ] Operational or administrative journeys are included.
- [ ] Ambiguous terms are added to the glossary.
- [ ] Candidate requirements are not treated as approved until reviewed in `REQUIREMENTS.md`.
