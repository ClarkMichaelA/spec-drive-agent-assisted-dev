# Specialized Agent Roles

## Why use specialized roles

A working agreement tells every contributor how to behave safely. A specialized role narrows the perspective for one assignment: what to examine, what it may change, which checks matter most, when to escalate, and what durable output to leave behind.

The scaffold keeps the universal agreement in `AGENTS.md` and portable role definitions under `agents/`. The role files supplement the working agreement; they do not override approved requirements, accepted decisions, human direction, or approval boundaries.

## What a role file does

A role definition should state:

- Its purpose and when to use it
- Responsibilities and required reading
- Permitted outputs
- Required checks or review criteria
- Authority boundaries and escalation conditions
- Handoff requirements and completion-report format

A Markdown role file does not launch, schedule, isolate, or coordinate a separate AI process. It becomes active only when a human instruction, task, or runtime integration selects it. The canonical role definitions remain portable even if a particular tool later maps them into its own configuration.

## The scaffold's role catalog

| Role | Canonical file | Primary purpose |
|---|---|---|
| Project Analyst | `agents/project-analyst.md` | Clarify intent, journeys, requirements, assumptions, and risks |
| Solution Architect | `agents/solution-architect.md` | Translate approved requirements into design and proposed decisions |
| Software Engineer | `agents/software-engineer.md` | Implement one approved Ready task and produce validation evidence |
| Test Engineer | `agents/test-engineer.md` | Evaluate behavior and test quality against the approved specification |
| Security Reviewer | `agents/security-reviewer.md` | Evaluate security and privacy effects and record evidence-based findings |
| Documentation Reviewer | `agents/documentation-reviewer.md` | Check durable project memory for consistency and traceability |

Use `agents/ROLE-TEMPLATE.md` when another genuinely distinct responsibility needs a durable role definition. Do not create a new role merely to change tone or rename an existing responsibility.

## Select roles through tasks and prompts

The detailed task record should distinguish:

- **Owner:** the person or contributor responsible for the task
- **Primary role:** the working perspective used to perform it
- **Required reviews:** the role perspectives that must review it
- **Review records:** paths to durable review evidence

Use one primary role unless a human instruction or task explicitly authorizes a change. If the role changes, state the change, reread the new role file, and keep the work under each role distinguishable in the handoff or review record.

Example implementation instruction:

```text
Act as the Software Engineer role defined in agents/software-engineer.md.
Follow AGENTS.md, read task [T-000] and its linked sources, and complete only
that Ready task.
```

Example review instruction:

```text
Act as the Test Engineer role defined in agents/test-engineer.md. Independently
review task [T-000] at revision [REVISION]. Record the result under
docs/reviews/ before any production-code correction.
```

## Use roles across the lifecycle

An illustrative sequence is:

1. The Project Analyst develops reviewable intent, journeys, and requirements.
2. A human approves product intent.
3. The Solution Architect prepares design and proposed decision records.
4. A human approves difficult-to-reverse decisions.
5. The Software Engineer implements a Ready task.
6. The Test Engineer verifies behavior and acceptance criteria.
7. The Security Reviewer examines changes with meaningful security impact.
8. The Documentation Reviewer checks consistency and traceability.
9. An authorized person accepts the result, requests correction, or records a waiver.

This is adaptable. A small documentation correction may need only one primary role and self-review. A high-risk change may require several independent reviews.

## Preserve review independence

Role labels do not create independence. An assistant that implements a change and then adopts a reviewer role in the same context is performing a self-review or non-independent review. Record it accurately.

When risk warrants independent review, use a separate assistant session, invocation, model, or human reviewer that did not produce the work. Give the reviewer the task, authoritative sources, exact revision, and evidence. Record reviewer role, identity or assistant label, independence status, scope, checks, findings, required actions, disposition, and reverification under `docs/reviews/`.

Required reviews must be completed or explicitly waived by an authorized person before a task becomes Done. Findings requiring correction return the task to an appropriate non-Done state until correction and reverification are complete.

## Communicate through durable artifacts

Roles hand work to one another through:

- `TASKS.md`
- `HANDOFF.md`
- Active plans
- Decision records
- Review records under `docs/reviews/`
- Test evidence
- Source-control history

Chat history is not authoritative project state. A handoff should identify the current primary role, the next required review role, and the related review record when one exists.

## Roles are not parallelism

One assistant can perform different roles sequentially, provided role changes and review independence are represented honestly. Several assistants can also use the same role on different tasks. Parallel execution is a separate runtime and coordination decision.

Before running workstreams in parallel, establish non-overlapping ownership, separate branches or workspaces, stable interfaces, authoritative shared task state, workstream-specific handoffs, and an integration review. Do not infer any of those controls merely because role files exist.
