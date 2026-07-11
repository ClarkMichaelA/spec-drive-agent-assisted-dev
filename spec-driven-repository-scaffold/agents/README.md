# Specialized Agent Roles

## Purpose

This directory contains portable role definitions for AI assistants and human contributors. A role defines a perspective, responsibilities, authority boundaries, expected checks, and durable outputs. These files do not launch or schedule separate processes, guarantee independent review, or grant permissions beyond the repository's working agreement. They are intentionally independent of any model or assistant product.

## Precedence

The authority order in [`../AGENTS.md`](../AGENTS.md) remains controlling. A selected role fits into that order as operating guidance: approved requirements and explicit current human direction come first, followed by accepted decision records, approved architecture and security documentation, the root working agreement, the selected specialized role, the active implementation plan, the selected task and its acceptance criteria, [`../HANDOFF.md`](../HANDOFF.md), and existing behavior unless that behavior is the defect under investigation.

A role supplements the working agreement. It cannot override approved intent, decisions, approval requirements, or safety boundaries.

## Agent catalog

| Role | File | Primary purpose | Typical outputs |
|---|---|---|---|
| Project Analyst | [`project-analyst.md`](project-analyst.md) | Clarify product intent and develop reviewable requirements | Project, journey, requirement, assumption, risk, and review updates |
| Solution Architect | [`solution-architect.md`](solution-architect.md) | Translate approved requirements into coherent technical design | Architecture, decision records, interface designs, and plan guidance |
| Software Engineer | [`software-engineer.md`](software-engineer.md) | Implement an approved Ready task | Source, tests, scripts, technical documentation, and task state |
| Test Engineer | [`test-engineer.md`](test-engineer.md) | Evaluate behavior against its approved specification | Tests, reproducible evidence, and test review records |
| Security Reviewer | [`security-reviewer.md`](security-reviewer.md) | Evaluate security and privacy effects | Evidence-based findings and security review records |
| Documentation Reviewer | [`documentation-reviewer.md`](documentation-reviewer.md) | Check durable project memory for consistency and traceability | Documentation corrections and review records |

Use [`ROLE-TEMPLATE.md`](ROLE-TEMPLATE.md) to define another role.

## Selecting a role

The selected task or current human instruction should name the role explicitly. For example:

> Act as the Software Engineer role defined in `agents/software-engineer.md`. Follow `AGENTS.md`, read the selected task and its linked sources, and complete only that task.

For a review:

> Act as the Test Engineer role defined in `agents/test-engineer.md`. Review the specified task independently and record the result under `docs/reviews/`. Do not modify production code during the initial review.

## Role switching

Use one primary role for a task unless explicitly authorized otherwise. State any role change, reread the new role file before continuing, and keep work performed under different roles separable in the handoff or review record. A self-review is useful but is not an independent review.

## Suggested workflow

This workflow is illustrative and may be shortened for small, low-risk tasks:

1. The Project Analyst clarifies intent, journeys, and requirements.
2. A human reviews and approves product intent.
3. The Solution Architect prepares the design and proposed decision records.
4. A human reviews difficult-to-reverse decisions.
5. The Software Engineer implements a Ready task.
6. The Test Engineer verifies behavior and acceptance criteria.
7. The Security Reviewer reviews changes with meaningful security impact.
8. The Documentation Reviewer checks consistency and traceability.
9. A human or authorized reviewer accepts, rejects, or requests corrections.

## Handoffs

Roles communicate through durable artifacts, especially [`../TASKS.md`](../TASKS.md), [`../HANDOFF.md`](../HANDOFF.md), active plans under [`../docs/plans/active/`](../docs/plans/active/), review records under [`../docs/reviews/`](../docs/reviews/), decision records, test evidence, and source-control history. Chat history is not authoritative project state.

## Runtime orchestration distinction

These files are repository-level role definitions. They describe how a selected contributor should work; they do not start, coordinate, or isolate runtime processes. A future tool-specific integration may translate these roles into a particular assistant's configuration, but the canonical, portable definitions remain in this directory.
