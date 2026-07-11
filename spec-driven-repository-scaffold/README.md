# Spec-Driven, Agent-Assisted Project Scaffold

This repository is a reusable starting point for software projects that are planned with specifications and delivered with help from one or more AI assistants.

It is deliberately vendor-neutral. Nothing in this scaffold depends on a particular model, coding assistant, source-control host, cloud provider, programming language, or deployment platform.

## What this scaffold is trying to accomplish

The repository itself should become the durable memory of the project. Chat history is temporary. The approved project documents, source code, tests, decisions, plans, and task records are the source of truth.

The basic flow is:

1. Define the problem and desired outcomes in `docs/PROJECT.md`.
2. Describe realistic user behavior in `docs/user_journeys/` (one file per journey; index in `README.md`).
3. Convert the approved intent into testable requirements in `docs/REQUIREMENTS.md`.
4. Record consequential technical choices as decision records in `docs/decisions/`.
5. Describe the accepted design in `docs/ARCHITECTURE.md`.
6. Organize delivery outcomes in `docs/ROADMAP.md`.
7. Create one implementation plan for the active milestone or feature in `docs/plans/active/`.
8. Break that plan into small, verifiable tasks in `TASKS.md`.
9. Implement one task or a small approved batch, then test and review it.
10. Update project state in `TASKS.md`, `HANDOFF.md`, and any affected source documents.

## Start here

Replace all text in square brackets, such as `[PROJECT NAME]`, with project-specific information. Remove sections that are genuinely unnecessary rather than leaving misleading placeholders.

For a new project, work through these files in this order:

- `docs/PROJECT.md`
- `docs/user_journeys/README.md` and `docs/user_journeys/UJ-001-template.md`
- `docs/REQUIREMENTS.md`
- `docs/ASSUMPTIONS.md` and `docs/RISKS.md`
- `docs/decisions/ADR-0000-template.md`
- `docs/ARCHITECTURE.md`
- `docs/ROADMAP.md`
- `docs/plans/active/PLAN-000-template.md`
- `TASKS.md`

Review and approve each major layer before using it to generate the next one. Approval does not mean the document can never change. It means changes should be deliberate, visible, and traceable.

## Document status

Use one of these statuses near the top of planning documents:

- **Draft** - still being developed; do not treat it as authoritative.
- **In Review** - ready for human review; comments and corrections are expected.
- **Approved** - accepted as the current source of truth.
- **Superseded** - retained for history but replaced by a newer artifact.
- **Archived** - no longer active and not replaced directly.

## A small-project option

Do not create process for its own sake. For a small experiment, you may combine:

- `PROJECT.md`, `user_journeys/`, and `REQUIREMENTS.md` into one `SPEC.md`.
- `ROADMAP.md`, an implementation plan, and `TASKS.md` into one short delivery plan.

Keep separate decision records for choices that will be difficult or costly to reverse.

## Ground rules

- Humans approve product intent, scope, important constraints, and difficult-to-reverse choices.
- Assistants may elaborate, critique, plan, implement, test, and maintain project state within approved boundaries.
- Requirements describe what must be true. Architecture describes how the system is intended to make it true.
- A task is not complete because code was written. It is complete when its acceptance criteria are met and the required validation passes.
- Discoveries made during implementation may change earlier documents, but the change must not be hidden.
- Anything that can be checked automatically should eventually be enforced by scripts or continuous integration.

## Specialized roles

`AGENTS.md` contains the shared working rules for every assistant. The portable Markdown files under `agents/` define specialized roles; a task or human prompt selects the active role. Role files do not automatically create or coordinate parallel processes, and the approach remains vendor-neutral.

Self-review is expected, but when risk warrants independent review, use a separate assistant session, invocation, model, or human reviewer and record the review under `docs/reviews/`.

Implementation example:

> Act as the Software Engineer role defined in `agents/software-engineer.md`. Follow `AGENTS.md` and complete only the selected Ready task.

Review example:

> Act as the Test Engineer role defined in `agents/test-engineer.md`. Independently review the selected task and record evidence under `docs/reviews/`.

See [`agents/README.md`](agents/README.md) for the role catalog and operating guidance.

## Repository map

```text
/
|-- AGENTS.md                  # Vendor-neutral working agreement for AI assistants
|-- agents/                    # Portable specialized role definitions
|   |-- README.md              # Role catalog and operating guide
|   |-- ROLE-TEMPLATE.md       # Template for additional roles
|   |-- project-analyst.md
|   |-- solution-architect.md
|   |-- software-engineer.md
|   |-- test-engineer.md
|   |-- security-reviewer.md
|   `-- documentation-reviewer.md
|-- README.md                  # This file
|-- CONTRIBUTING.md            # Human and assistant contribution workflow
|-- TASKS.md                   # Current executable work queue
|-- HANDOFF.md                 # Current operational state between work sessions
|-- CHANGELOG.md               # User-visible and operator-visible changes
|-- docs/
|   |-- INDEX.md               # Documentation map and reading order
|   |-- PROJECT.md             # Problem, users, outcomes, scope, and constraints
|   |-- REQUIREMENTS.md        # Testable functional and quality requirements
|   |-- ARCHITECTURE.md        # Current accepted technical design
|   |-- ROADMAP.md             # Outcome-based milestones and sequencing
|   |-- ASSUMPTIONS.md         # Unverified beliefs that could affect the project
|   |-- RISKS.md               # Risk register and treatment actions
|   |-- TRACEABILITY.md        # Links among goals, requirements, decisions, tasks, and tests
|   |-- SECURITY.md            # Security and privacy design
|   |-- OPERATIONS.md          # Deployment, monitoring, recovery, and support
|   |-- TEST_STRATEGY.md       # Test layers, environments, gates, and evidence
|   |-- DATA_MODEL.md          # Data concepts, ownership, lifecycle, and migrations
|   |-- API.md                 # Interface contracts and conventions, if applicable
|   |-- CHANGE_CONTROL.md      # How approved scope and design changes are handled
|   |-- GLOSSARY.md            # Shared domain and technical vocabulary
|   |-- user_journeys/         # Journey index and one file per user journey
|   |-- decisions/             # Architecture and product decision records
|   |-- plans/                 # Active and completed implementation plans
|   `-- reviews/               # Structured review records
|-- src/                       # Product source code
|-- tests/                     # Automated tests and test support
|-- scripts/                   # Repeatable build, validation, and maintenance commands
`-- ci/                        # Platform-neutral notes for automated quality gates
```

## First-use checklist

- [ ] Rename the extracted folder for your project.
- [ ] Initialize source control.
- [ ] Complete `docs/PROJECT.md`.
- [ ] Decide which optional documents are necessary.
- [ ] Update `AGENTS.md` with real commands and project-specific boundaries.
- [ ] Create the first approved requirement set.
- [ ] Record important decisions instead of burying them in chat history.
- [ ] Create a walking-skeleton milestone that proves the system can build, test, and run end to end.
- [ ] Configure automated checks before the codebase becomes large.

## Important reminder

An AI assistant can produce polished text that is still incorrect. Treat generated content as a draft until it has been checked against the real business need, technical environment, security constraints, and test evidence.
