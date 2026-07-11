# 5. Decisions and Architecture

## Goal of this stage

Choose an approach that satisfies the approved requirements with acceptable cost, risk, complexity, and operability. Preserve the reason behind important choices.

## Requirements come before most architecture decisions

Requirements explain what must be true. Architecture explains how the system is intended to make it true.

Some constraints exist from the beginning, such as an approved platform, required hosting location, or regulatory boundary. Record these as constraints and cite their source. Do not treat an AI suggestion as a real constraint.

## Decision records

Create a decision record for a choice that is:

- Difficult or expensive to reverse
- Significant to security, data, operations, or compatibility
- A major dependency selection
- A public-interface or deployment-model choice
- A resolution among meaningful alternatives
- Likely to be questioned again later

A useful decision record includes:

- Context
- Decision criteria
- Options considered
- Decision
- Rationale
- Positive and negative consequences
- Follow-up work
- Revisit triggers
- Approval

Do not rewrite accepted history. When a decision changes, create a new record that supersedes the old one.

## Architecture contents

A practical architecture should explain:

- Users and external systems
- Components and responsibilities
- Data and control flows
- Trust boundaries
- Interfaces
- Data ownership and lifecycle
- Authentication and authorization
- Deployment environments
- Failure handling
- Observability and support
- Performance and capacity assumptions
- Tradeoffs and known gaps
- Mapping to requirements

## Verify external technical facts

Architecture often depends on facts that may change or be easy to misremember:

- Product capabilities and licensing
- API schemas and limits
- Runtime support
- Security standards
- Cloud or platform behavior
- Compatibility and lifecycle dates

Verify these with authoritative documentation before accepting the design.

## Useful AI sequence

### Step 1: Identify decision candidates

Ask the AI to list only consequential choices that genuinely need a decision record.

### Step 2: Analyze options

For each candidate, compare options against approved requirements and constraints. Ask for assumptions and evidence gaps.

### Step 3: Human chooses

You own the tradeoff. The AI may recommend, but it should explain why and how confident it is.

### Step 4: Draft architecture

Create the architecture from approved requirements and accepted decisions.

### Step 5: Independent critique

Use a fresh context to challenge:

- Unnecessary complexity
- Missing failure paths
- Weak trust boundaries
- Hidden single points of failure
- Poor operability
- Unverified external assumptions
- Requirements not satisfied
- Decisions embedded without records

## Copy-ready decision-candidate prompt

```text
Read the approved requirements, constraints, current decision records, and
architecture template.

Identify the consequential decisions that must be made before implementation.
Do not create a decision record for ordinary local coding choices.

For each candidate provide:
- The decision question
- Requirements and constraints that drive it
- Why it is difficult or costly to defer or reverse
- Realistic options
- Evidence or research still needed
- Who should approve it

Do not select technologies merely because they are familiar or popular.
Do not invent product capabilities or external facts.
```

## Copy-ready architecture prompt

```text
Read the approved project brief, requirements, security needs, accepted
decision records, and docs/ARCHITECTURE.md template.

Draft the architecture that is no more complex than the requirements justify.

Include:
- System context and external dependencies
- Components with one clear responsibility each
- Main success and failure flows
- Data ownership and lifecycle
- Interfaces and compatibility
- Trust boundaries, authentication, authorization, secrets, and audit
- Deployment, configuration, observability, support, backup, and rollback
- Requirement mapping
- Known gaps and assumptions

Rules:
- Do not introduce an unapproved consequential choice silently.
- Separate verified facts from assumptions.
- Flag external facts that require authoritative verification.
- Prefer reversible, simple choices when requirements do not demand complexity.

Return the architecture draft plus a list of proposed decision records and the
five highest-risk review questions.
```

## Exit criteria

Proceed to roadmap and implementation planning when:

- Consequential choices are accepted and recorded.
- Architecture maps to approved requirements.
- Trust boundaries, sensitive data, permissions, and failure paths are visible.
- Deployment, support, monitoring, backup, and rollback are considered.
- Important external assumptions are verified or explicitly tracked.
- Human reviewers accept the design for the next milestone.
