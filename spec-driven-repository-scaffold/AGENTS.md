# Working Agreement for AI Assistants

This file tells any AI assistant how to work safely and consistently in this repository. It is tool-neutral. If an assistant does not automatically read this file, instruct it to read this file before beginning work.

## 1. Project purpose

Project: `[PROJECT NAME]`

Purpose: `[ONE OR TWO SENTENCES EXPLAINING WHAT THE PROJECT DELIVERS]`

Primary users: `[USER GROUPS]`

Current lifecycle stage: `[DISCOVERY | PLANNING | IMPLEMENTATION | PILOT | PRODUCTION | MAINTENANCE]`

## 2. Start-of-work reading order

Before changing anything:

1. Read this file.
2. Read `docs/INDEX.md`.
3. Read `HANDOFF.md` and verify that it matches the actual repository state.
4. Read the selected task in `TASKS.md`.
5. Read only the requirements, decision records, architecture sections, and active plan linked from that task.
6. Inspect the relevant source code and tests before proposing changes.

Do not rely on chat history as the source of truth when the repository contains approved information.

## 3. Authority and conflicts

Use this order when interpreting project intent:

1. Approved requirements and explicit human direction for the current change
2. Accepted decision records
3. Approved architecture and security documentation
4. The active implementation plan
5. The selected task and its acceptance criteria
6. The handoff file
7. Existing code behavior, unless the code is itself the defect being corrected

If authoritative sources conflict, stop the affected work and clearly identify the conflict. Do not silently choose one source or rewrite an approved document to match the current code.

## 4. Core working rules

- Do not invent requirements, constraints, external facts, credentials, APIs, data fields, or success criteria.
- Do not expand scope merely because an adjacent improvement appears useful.
- Do not introduce a new production dependency, externally visible interface, data migration, trust-boundary change, or difficult-to-reverse design choice without the required review and decision record.
- Preserve user-authored work. Never discard unrelated changes.
- Never place secrets, tokens, private keys, passwords, or production data in source files, logs, prompts, fixtures, or documentation.
- Prefer the smallest change that fully satisfies the approved acceptance criteria.
- Add or update tests whenever behavior changes.
- Run the required validation before claiming completion.
- Report failures honestly. Do not describe a task as complete when required checks did not run or did not pass.
- Update durable project state before ending a work session.

## 5. Task execution loop

Unless the task explicitly authorizes a batch, complete exactly one `Ready` task at a time.

1. Confirm the task is `Ready` and its dependencies are complete.
2. Restate the objective, boundaries, and acceptance criteria in a short implementation plan.
3. Inspect the current implementation and existing tests.
4. Make the smallest coherent change.
5. Add or update automated tests.
6. Run the required validation commands.
7. Review the complete diff against the task, requirements, architecture, security rules, and project conventions.
8. Correct defects found during review.
9. Update affected documentation.
10. Mark the task accurately in `TASKS.md`.
11. Update `HANDOFF.md` with evidence, remaining issues, and the next recommended task.
12. Stop and report what changed, what was validated, and any unresolved risk.

## 6. Definition of Ready

A task may be marked `Ready` only when:

- Its objective is understandable.
- Its linked requirements are approved or explicitly authorized for the current experiment.
- Acceptance criteria are observable and testable.
- Dependencies are identified and complete.
- Scope and out-of-scope boundaries are stated.
- Important security, data, migration, and operational effects are understood.
- No unresolved high-impact question prevents safe implementation.

If a task is not ready, move it to `Blocked` or `Backlog` and record what is missing.

## 7. Definition of Done

A task is `Done` only when:

- All acceptance criteria are satisfied.
- Required tests and checks pass.
- New behavior has appropriate automated coverage, or the approved exception is documented.
- Error paths and boundary cases relevant to the task are handled.
- No known critical or high-severity defect was introduced.
- Documentation and examples affected by the change are updated.
- User-visible changes are added to `CHANGELOG.md` when appropriate.
- `TASKS.md` and `HANDOFF.md` reflect the actual repository state.
- The final report includes validation evidence and any limitations.

## 8. Autonomy boundaries

### Proceed without additional approval

Examples:

- Implementing a ready task exactly as specified
- Adding tests for approved behavior
- Correcting a clear defect within existing architecture
- Refactoring locally without changing external behavior
- Improving comments or documentation to match approved behavior
- Adding repeatable validation scripts that do not alter production behavior

### Propose and wait for approval

Examples:

- Adding or replacing a production dependency
- Changing a public API or user-visible workflow
- Changing authentication, authorization, encryption, or trust boundaries
- Adding a database or schema migration
- Changing an accepted architecture decision
- Expanding scope beyond the selected task
- Making a change that is difficult to reverse

For these items, describe the need, options, recommendation, consequences, and proposed decision record.

### Never perform without explicit, current authorization

Examples:

- Destructive operations against real data
- Production deployment or rollback
- Permission escalation
- Secret rotation or credential use
- Disabling security controls
- Irreversible data conversion
- Sending external communications or making purchases

## 9. Handling uncertainty

Use this rule:

- Low-impact and easily reversible uncertainty: choose the conservative option, state the assumption, and record it in `docs/ASSUMPTIONS.md` if it can affect future work.
- High-impact or difficult-to-reverse uncertainty: stop and present alternatives for review.
- Missing requirement discovered during implementation: propose a requirement update; do not quietly redefine the requirement through code.
- Unexpected scope: finish only the safe portion, document the remainder, and do not conceal incomplete work.

## 10. Required commands

Replace the placeholders below with commands that work from the repository root.

```text
Environment setup: [COMMAND OR N/A]
Build:             [COMMAND]
Format check:      [COMMAND]
Static analysis:   [COMMAND]
Unit tests:        [COMMAND]
Integration tests: [COMMAND OR N/A]
Security checks:   [COMMAND OR N/A]
Full validation:   [COMMAND]
Run locally:       [COMMAND]
```

If a command is unavailable, say so explicitly and do not pretend it was run.

## 11. Project conventions

```text
Primary language(s):       [LANGUAGES]
Runtime/framework:         [RUNTIME OR FRAMEWORK]
Package/dependency policy: [POLICY]
Formatting standard:       [STANDARD OR TOOL]
Error-handling convention: [CONVENTION]
Logging convention:        [CONVENTION]
Configuration approach:    [CONVENTION]
Testing convention:        [CONVENTION]
Documentation style:       [CONVENTION]
```

Keep this section short. Put detailed technical guidance in the relevant documents under `docs/`.

## 12. Documentation update rules

Update only the documents affected by the change:

| Change | Usually update |
|---|---|
| Product behavior or acceptance rule | `docs/REQUIREMENTS.md`, tests, possibly user documentation |
| Consequential design choice | New decision record and `docs/ARCHITECTURE.md` |
| Delivery sequence or milestone scope | `docs/ROADMAP.md` or active implementation plan |
| Task state | `TASKS.md` |
| Current session state | `HANDOFF.md` |
| User-visible or operator-visible change | `CHANGELOG.md` |
| New risk or assumption | `docs/RISKS.md` or `docs/ASSUMPTIONS.md` |
| Security or privacy behavior | `docs/SECURITY.md` and relevant tests |
| Deployment or support behavior | `docs/OPERATIONS.md` |

Do not update `CHANGELOG.md` for formatting-only work, test-only work, or invisible refactoring unless the project has explicitly chosen a different policy.

## 13. End-of-work report

At the end of every work session, provide:

1. Completed changes
2. Files modified
3. Tests and checks run, with results
4. Remaining issues, risks, or assumptions
5. Task and handoff updates made
6. Recommended next task or next review action

Keep the report factual. Separate verified results from recommendations.
