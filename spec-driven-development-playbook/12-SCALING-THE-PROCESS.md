# 12. Scaling the Process

## Match rigor to risk and size

The goal is not maximum documentation. The goal is enough durable clarity and evidence for the consequences of the work.

## Small experiment or prototype

Use:

- One combined `SPEC.md`
- A short decision section or a few decision records
- One implementation plan
- A task list
- Tests for the risky assumptions
- A handoff

Do not pretend a prototype is production-ready. State which security, operations, data, performance, and support concerns are intentionally deferred.

## Small production application

Use:

- Project brief
- Journeys and requirements
- Decision records
- Architecture
- Roadmap and active plans
- Task queue
- Test strategy
- Security and operations sections
- Automated validation
- Release review

## Larger or higher-risk project

Add as needed:

- Formal threat model
- Data classification and retention approval
- Interface contracts and compatibility gates
- Migration and cutover plans
- Generated traceability reports
- Separate quality, security, and operational reviews
- Environment promotion and release evidence
- Incident and recovery exercises
- Formal ownership and approval records

## Moving from one agent to several

Parallel work increases coordination cost. Before adding agents:

- Make task boundaries and dependencies explicit.
- Assign ownership of components or files.
- Use separate branches or workspaces.
- Avoid a single shared handoff file for concurrent edits.
- Define integration points and contract tests.
- Keep authoritative task state in a shared tracker.
- Require each workstream to return evidence and a handoff.
- Run an integration review after combining changes.

Possible roles:

- Planner: prepares implementation plan and tasks
- Implementer: completes a bounded task
- Reviewer: challenges the completed change
- Test specialist: focuses on failure, security, and system behavior
- Documentation reconciler: checks source-of-truth consistency

Roles do not require different products or models. They are simply different instructions and contexts.

## When to move tasks out of Markdown

`TASKS.md` works well for a solo developer or one sequential agent. Consider a shared issue tracker when:

- Several people or agents work concurrently
- Tasks need assignment, comments, due dates, or dashboards
- Branch and review links need automation
- Task status conflicts become common
- Reporting is required

Keep requirement and decision IDs in the tracker so traceability survives the move.

## Context-window strategy

As the repository grows:

- Keep an accurate documentation index.
- Summarize component purpose near the component.
- Link tasks directly to relevant sections.
- Archive completed plans without deleting them.
- Generate compact reports from structured metadata where practical.
- Do not ask an assistant to read every file by default.

## Maturity progression

### Level 1: Structured prompting

You use templates and review AI drafts.

### Level 2: Repository memory

Intent, decisions, tasks, tests, and handoffs live in versioned files.

### Level 3: Bounded delivery loops

Ready tasks can be implemented with minimal prompting and explicit stop conditions.

### Level 4: Executable governance

Build, test, security, compatibility, and documentation rules are enforced automatically.

### Level 5: Safe parallelism

Multiple workstreams operate against stable interfaces, shared task state, and reliable integration gates.

Do not skip directly to parallel autonomous agents before the single-task loop is reliable.
