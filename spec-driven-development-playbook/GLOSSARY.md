# Glossary

## Acceptance criterion

Something you can observe. If you cannot tell it failed, it is decoration.

## Agent-assisted development

An assistant does bounded work. You own intent, irreversible choices, the plan, and release.

## Architecture

The current accepted shape: parts, flows, interfaces, trust, deploy.

## Assumption

Treated as true without enough evidence. Needs an impact and a way to kill it.

## Decision record

Why we picked the expensive option, what we rejected, when to revisit.

## Definition of Done

For a task: criteria true on the plan branch, checks ran, needed reviews done. Not "merged." Not "code exists."

## Definition of Ready

The plan already authorized the task, dependencies are done, and nothing expensive is still a question. The agent checks this. You do not.

## Evidence

A command result, a demo, a source, a review that cites a SHA. Not a vibe.

## Independent review

A context that did not produce the work. Same chat, new role name = self-review.

## Implementation plan

How one milestone will be built and proven. The thing you approve. Contains phases, tasks, review policy, stops.

## Milestone

An outcome with exit evidence.

## Phase

A slice of a plan you can run or see. The coding agent stops here. You steer here.

## Plan branch

`plan/<milestone>-…` off `main`. Tasks commit here. A phase lands on `main` with one PR.

## Requirement

What must be true, with a way to know.

## Risk

An uncertainty that can hurt. Treat it or accept it. Do not list it for sport.

## Spec-driven

Approved files and tests drive the work. Code does not silently rewrite them.

## Specialized role

A perspective in `agents/`. Not a process. Not a second employee.

## Task

One provable unit of work. Fuel. Not a management object.

## Traceability

Why this exists, what decision supports it, which test proves it.

## Vertical slice

A thin path through the system that proves one outcome.

## Walking skeleton

The smallest end-to-end that builds, runs, and can be tested. Usually milestone one.

## Work-plan entry point

Runtime-specific entry point that executes `docs/WORK_PLAN.md` until a phase checkpoint, blocker, or task cap.
