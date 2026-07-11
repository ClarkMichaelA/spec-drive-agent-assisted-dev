# Sample Session Sequence

This sequence shows how to avoid both constant micro-prompting and one uncontrolled mega-prompt. Each session has one purpose and a review point.

The role names below refer to the portable definitions under `agents/`. A role focuses one session; it does not automatically create a separate process.

## Session 1: Establish the project brief

Primary role: Project Analyst

Input:

- Rough idea
- Known users
- Current pain
- Desired outcome
- Constraints and exclusions

Prompt:

Use prompt 1 from `PROMPT-LIBRARY.md`.

Then use prompt 2 for critique. Review the result yourself and approve or revise `PROJECT.md`.

## Session 2: Discover journeys

Primary role: Project Analyst

Input:

- Approved project brief
- Any process evidence, interviews, screenshots, or current documentation

Prompt:

Use prompts 3 and 4.

Validate the important journeys with real users or process owners. Update assumptions and questions.

## Session 3: Create and review requirements

Primary role: Project Analyst. Use a separate reviewer when approval requires independence.

Input:

- Approved project brief
- Confirmed journeys

Prompt:

Use prompts 5 and 6.

Resolve business rules, priorities, quality targets, and unknown external facts. Approve the requirements that are ready.

## Session 4: Make decisions and architecture

Primary role: Solution Architect

Input:

- Approved requirements and constraints
- Enterprise standards or verified platform facts

Prompt:

Use prompts 7 through 10. Use prompt 11 when security or sensitive data is involved.

Approve important decision records and the architecture for the next milestone.

## Session 5: Roadmap and current plan

Primary role: Solution Architect

Input:

- Approved architecture
- Risks and assumptions
- Priority or delivery constraints

Prompt:

Use prompts 12 and 13.

Approve the roadmap and exactly one current implementation plan.

## Session 6: Build a Ready task queue

Primary role: Solution Architect or Project Analyst, as assigned. Each task names its own primary role and required reviews.

Input:

- Approved plan

Prompt:

Use prompts 14 and 15.

Make only the next set of tasks Ready. Leave later work in Backlog until dependencies and details are known.

## Session 7 and later: Deliver one task

Primary role: Software Engineer for implementation. Use the task's required Test Engineer, Security Reviewer, or Documentation Reviewer perspectives afterward.

Prompt:

Use prompt 16. For medium- or high-risk work, follow with prompt 18 under the required reviewer role in a fresh context. Use prompt 19 to fix approved findings.

End with prompt 28 or the standing handoff instruction in the working agreement.

## Milestone review session

When all milestone tasks are done:

- Reconcile documentation with prompt 21.
- Run release readiness with prompt 27.
- Demonstrate the outcome to the owner.
- Record accepted limitations and release decision.
- Move the plan to completed.
- Select and plan the next roadmap milestone.

## The recurring minimal prompt

Once the repository is healthy, your routine prompt can be brief:

```text
Continue with the highest-priority Ready task according to the repository
working agreement. Read and identify its selected primary role, complete exactly
one task, validate it, update durable project state, and stop with evidence.
```

This works only because the task, requirements, design, commands, boundaries, and handoff are already in the repository.
