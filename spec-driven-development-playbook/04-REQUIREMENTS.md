# 4. Requirements

## Goal of this stage

Convert approved intent and journeys into statements that can guide design and be verified later.

A requirement answers what must be true. It should not normally dictate how the code is written.

## Main requirement types

- **Functional:** behavior the system must provide
- **Quality or nonfunctional:** performance, availability, usability, compatibility, maintainability, and similar properties
- **Security and privacy:** access, protection, audit, data exposure, and abuse resistance
- **Data:** integrity, ownership, lifecycle, retention, synchronization, and migration
- **Operational:** deployment, monitoring, backup, restore, support, and recovery
- **Integration:** behavior at an external boundary
- **Constraint:** a limit imposed from outside the design

## What makes a requirement useful

A good requirement is:

- Necessary
- Understandable
- Singular: one main idea
- Feasible
- Testable or otherwise objectively verifiable
- Traceable to an outcome, journey, policy, risk, or stakeholder need
- Free of accidental implementation detail

Weak:

```text
The system must be fast and secure.
```

Stronger pattern:

```text
Under [defined workload and environment], the system shall [measurable result].
```

Security pattern:

```text
The system shall deny [action] unless [verified authorization condition],
and shall record [audit event] without storing [sensitive fields].
```

## Avoid design disguised as a requirement

"Use a relational database" is usually a design decision.

"Preserve transactional consistency across these business operations" may be a requirement.

A mandated database can still be a constraint when an enterprise standard or contract requires it. Record the source of the constraint.

## An efficient AI sequence

### Pass 1: Extract candidate requirements

Generate candidates from approved project outcomes and journeys. Preserve links back to the source IDs.

### Pass 2: Add overlooked categories

Ask for security, data, operations, integrations, failure behavior, and measurable quality needs.

### Pass 3: Quality review

Use a separate prompt to find:

- Ambiguity
- Multiple ideas in one requirement
- Unmeasurable language
- Conflicts and duplicates
- Hidden design decisions
- Missing sources or verification methods
- Requirements that exceed approved scope

### Pass 4: Human approval

Confirm business rules and priorities. Do not let the AI choose target values that require business or operational judgment.

## Copy-ready requirements prompt

```text
Read the approved docs/PROJECT.md and docs/user_journeys/, plus the template
in docs/REQUIREMENTS.md.

Draft a requirements specification using stable IDs. Include functional,
quality, security/privacy, data, operational, and integration requirements
only where supported by the approved project intent and journeys.

Rules:
- Do not invent business rules, target values, external-system behavior,
  regulations, or policies.
- Mark unknown values as TBD and identify who should decide them.
- Make every requirement testable or give it an objective verification method.
- Link each requirement to its source outcome or journey.
- Separate requirements from architecture choices.
- Include failure, recovery, authorization, audit, and support behavior.
- Do not expand approved scope.

Return:
1. Proposed docs/REQUIREMENTS.md content
2. A list of unresolved decisions required before approval
3. A list of requirements that need external fact verification
```

## Human review questions

- Does each Must requirement correspond to a real need?
- Are priorities correct?
- Are acceptance criteria specific enough to test?
- Are error and recovery outcomes useful and safe?
- Are performance or availability targets justified?
- Are security and data requirements appropriate to the real risk?
- Are operational requirements sufficient to run the system?
- Did a technology preference accidentally become a requirement?

## Exit criteria

Proceed to decisions and architecture when:

- Must requirements are approved.
- Important quality targets have owners and verification methods.
- Security, data, operations, and external interfaces are not ignored.
- Contradictions and duplicates are resolved.
- Remaining unknowns are visible and do not block safe design.
