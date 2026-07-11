# 6. Roadmap, Implementation Plans, and Tasks

## Why there are three levels

These artifacts answer different questions:

- **Roadmap:** Which outcomes come first?
- **Implementation plan:** How will one outcome be delivered safely?
- **Tasks:** What small units of work can now be executed and verified?

Jumping directly from architecture to a long task list often creates missing dependencies, hidden design choices, and tasks that are too large.

## Roadmap: organize around outcomes

Good milestone:

```text
A pilot user can complete the primary journey in a test environment, and the
team can observe and diagnose failures.
```

Weak milestone:

```text
Build database, then backend, then frontend.
```

The first useful milestone is often a walking skeleton: a thin end-to-end path that proves the application can build, run, communicate, store or retrieve minimal data, and be tested.

Each milestone should state:

- Usable or risk-reducing outcome
- Requirements included
- Explicit exclusions
- Dependencies
- Risks or uncertainties reduced
- Exit evidence

## Implementation plan: bridge design and work

Create a plan when work spans components, modifies data, changes an interface, needs sequencing, or carries deployment risk.

A plan should cover:

- Outcome and scope
- Current and target state
- Components affected
- Data and interface changes
- Security and permissions
- Ordered implementation phases
- Test approach
- Deployment, migration, and rollback
- Observability and support
- Risks, assumptions, and open questions
- Proposed task breakdown

Approve the plan before asking an AI to generate detailed tasks.

## Tasks: executable contracts

A Ready task should include:

- One concrete objective
- Linked requirements and design
- Included and excluded scope
- Dependencies
- Observable acceptance criteria
- Validation commands or methods
- Risks and rollback, when relevant
- An owner and primary role
- Required review roles and review-record paths, when applicable

Tasks should be small enough to implement and review as one coherent change.

The owner is the responsible contributor. The primary role is the perspective used to do the work. Required reviews name additional perspectives that must be completed or explicitly waived by an authorized person before the task becomes Done. Do not treat a self-review as an independent required review.

## Prefer vertical slices

A vertical slice delivers a thin path through the system for one outcome. It may touch interface, business logic, data, and tests. This exposes integration and architecture problems early.

Avoid planning every data component first, then every service component, then every interface component, unless the architecture genuinely requires that sequence.

## Definition of Ready

A task is Ready when:

- Its requirement is approved.
- Its acceptance criteria are testable.
- Dependencies are complete.
- Scope and out-of-scope are clear.
- Security, data, interface, migration, and operational effects are understood.
- No unresolved high-impact question remains.

## Copy-ready roadmap prompt

```text
Read the approved project brief, requirements, architecture, risks, and the
roadmap template.

Create an outcome-based roadmap. Begin with a walking-skeleton milestone that
proves the basic end-to-end delivery and validation path.

For each milestone include:
- Outcome
- Users served
- Requirements included
- Explicit exclusions
- Dependencies
- Risks or assumptions reduced
- Exit criteria and evidence

Do not turn the roadmap into a component task list. Do not invent delivery
dates or team capacity. Mark timing as TBD unless I provide it.
```

## Copy-ready implementation-plan prompt

```text
Read the approved requirements, accepted decisions, architecture, roadmap
milestone [M-00], active risks, and the implementation-plan template.

Draft one implementation plan for this milestone. Explain current state,
target behavior, affected components, data and interface changes, security,
ordered phases, tests, deployment, migration, rollback, observability, risks,
and proposed task boundaries.

Do not create tasks yet if the plan contains unresolved architecture choices or
high-impact questions. Clearly list those blockers first.
```

## Copy-ready task prompt

```text
Read the approved implementation plan [PATH], its linked requirements and
decision records, and TASKS.md.

Decompose the plan into the smallest coherent, dependency-ordered tasks that
produce demonstrable progress.

Each task must include:
- Stable ID and action-oriented title
- Objective and reason
- Linked requirements, architecture section, decisions, and plan
- Scope and out-of-scope
- Dependencies
- Observable acceptance criteria, including relevant failure behavior
- Validation commands or methods
- Risks and rollback when applicable
- Owner and primary role
- Required review roles, or None
- Review-record paths, initially None unless a record already exists

Mark a task Ready only when it meets the repository's Definition of Ready.
Select roles from agents/ without inventing fictional assignments. Do not hide
new architecture decisions inside tasks.
```

## Exit criteria

Begin implementation when:

- The active milestone has a clear outcome and exit evidence.
- One approved implementation plan exists for the current workstream.
- The next tasks are small, ordered, and Ready.
- Validation commands and environments exist or the first task creates them.
- High-impact design, security, and migration questions are resolved.
