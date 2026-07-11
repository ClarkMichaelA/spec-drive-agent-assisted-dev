# Contributing Workflow

This workflow applies to both human contributors and AI-assisted changes.

## Before beginning a change

1. Confirm that the problem is represented by an approved requirement or an explicitly authorized discovery task.
2. Select or create a task with clear acceptance criteria.
3. Check dependencies, risks, security effects, data effects, and operational effects.
4. Read the relevant decision records and architecture sections.
5. Create or update an implementation plan when the change spans multiple components or contains migration risk.

## Change sizes

Prefer changes that are small enough to understand and review as one coherent unit.

- **Small:** one local behavior, defect, test, or documentation correction.
- **Medium:** one vertical feature slice that may touch several layers but has one outcome.
- **Large:** multiple outcomes, broad refactoring, major migration, or architecture change. Split this into a plan and several tasks before implementation.

## Review expectations

Every change should be reviewed for:

- Correctness against acceptance criteria
- Requirement and architecture alignment
- Security and privacy impact
- Error handling and boundary behavior
- Test coverage and test quality
- Compatibility and migration safety
- Operational observability and supportability
- Unnecessary complexity
- Documentation drift

## Specialized roles and review separation

Contributors may work under a role defined in [`agents/`](agents/). The selected task should identify both its primary role and any required review roles. Selecting a role changes neither the repository's approval requirements nor the contributor's authority.

Self-review is expected but does not satisfy a requirement for independent review. Record review findings durably under `docs/reviews/`, link them from the task or handoff, and resolve required corrections visibly before completion.

## Validation

The exact commands belong in `AGENTS.md`. At minimum, run the checks relevant to the change. A change should not be described as complete when a required check was skipped, failed, or could not be run.

## Source-control hygiene

- Keep unrelated changes separate.
- Use descriptive commit messages.
- Do not commit generated secrets, local credentials, or sensitive data.
- Do not rewrite shared history without explicit team agreement.
- Preserve a clean, reviewable diff.

Suggested commit-message pattern:

```text
<type>: <clear outcome>

Why:
- [reason]

Validation:
- [commands and results]
```

Common types include `feature`, `fix`, `docs`, `test`, `refactor`, `build`, and `operations`.

## Documentation is part of delivery

A code change that makes an approved document false is incomplete. Update the relevant source-of-truth document in the same change, or document why a separate approved change is required.
