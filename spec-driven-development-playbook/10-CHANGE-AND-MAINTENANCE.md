# 10. Change and Maintenance

## Specifications are living controls

An approved document is not frozen forever. It is the current agreement. Changes should be visible, reviewed at the right level, and traced through the project.

## When implementation discovers a problem

Example situations:

- A business rule is missing.
- An external interface behaves differently from the assumption.
- A quality target is not feasible.
- A security boundary was overlooked.
- A task requires a schema migration not in the plan.
- Existing code contradicts an approved requirement.

Use this response:

1. Stop the affected work at a safe point.
2. State the discovery and evidence.
3. Identify affected requirements, decisions, architecture, plans, tasks, tests, and release claims.
4. Present realistic options and consequences.
5. Obtain the needed approval.
6. Update all affected artifacts coherently.
7. Re-plan and continue.

Do not quietly alter a requirement to excuse existing code.

## Change-request prompt

```text
A discovery may require changing approved project intent or design:

[DESCRIBE THE DISCOVERY AND EVIDENCE]

Read the affected project brief, requirements, decision records, architecture,
active plan, tasks, tests, risks, and assumptions.

Do not modify files yet. Prepare a change proposal with:
- Current approved state
- Proposed change
- Evidence and reason
- Affected artifacts and IDs
- Options, including doing nothing
- Impact on scope, delivery, security, data, operations, compatibility, and risk
- Recommendation and confidence
- Required approvers
- Follow-up tasks, tests, and decision records

Separate verified facts from assumptions. Do not use the current code as the
sole reason to weaken an approved requirement.
```

## Bug workflow

A bug should be tied to expected behavior:

1. Reproduce or obtain credible evidence.
2. Identify the violated requirement, acceptance criterion, interface contract, or documented behavior.
3. Add a failing test when practical.
4. Fix the smallest underlying cause.
5. Run regression checks.
6. Update documentation only if intended behavior changed through approval.

## Refactoring workflow

Refactoring should preserve behavior unless a behavior change is explicitly approved.

Before broad refactoring:

- State the maintainability or risk problem.
- Define protected behavior and regression tests.
- Identify boundaries and sequence.
- Avoid mixing unrelated feature changes.
- Decide how to roll back if the refactor destabilizes the system.

## Dependency updates

Treat dependency changes as real changes, not housekeeping. Check:

- Release notes and breaking changes
- Runtime and platform compatibility
- Security advisories
- License or usage constraints
- Transitive dependencies
- Test and rollback evidence

Verify facts from authoritative sources.

## Post-release learning

After meaningful releases, compare outcomes with the project brief:

- Are users reaching the intended outcome?
- Did success measures move?
- Which assumptions were validated or disproved?
- Which failures or support burdens appeared?
- Which requirements should change?
- Is architecture still appropriate?

Create new work from evidence, not from the AI's desire to continue expanding the project.
