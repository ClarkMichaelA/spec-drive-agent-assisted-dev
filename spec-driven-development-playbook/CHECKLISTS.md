# Checklists

## Project brief approval

- [ ] The problem is stated without assuming a solution.
- [ ] Primary users and stakeholders are identified.
- [ ] Outcomes are observable.
- [ ] Success measures have a measurement method.
- [ ] Scope and non-goals are explicit.
- [ ] Constraints have a real source.
- [ ] Assumptions and unknowns are visible.
- [ ] The owner approves the brief.

## Journey review

- [ ] Main users, administrators, operators, and support roles are represented.
- [ ] Triggers and prerequisites are realistic.
- [ ] Alternative, failure, and recovery paths exist.
- [ ] Permissions and privacy are considered.
- [ ] Data and audit behavior are described.
- [ ] Unverified process details are marked.

## Requirements approval

- [ ] Each Must requirement is necessary and in scope.
- [ ] Each requirement has one main idea.
- [ ] Acceptance criteria or verification methods are objective.
- [ ] Vague quality words have measurable conditions.
- [ ] Security, data, operations, and interfaces are addressed.
- [ ] Requirements do not conflict or duplicate each other.
- [ ] Design choices are not disguised as requirements.
- [ ] Unknown facts remain TBD rather than invented.

## Decision-record review

- [ ] A consequential decision is actually needed.
- [ ] Context and decision criteria are clear.
- [ ] Realistic alternatives are compared.
- [ ] Facts and assumptions are separated.
- [ ] Positive and negative consequences are visible.
- [ ] Follow-up work and revisit triggers are stated.
- [ ] The correct owner accepted the choice.

## Architecture review

- [ ] Components have clear responsibilities.
- [ ] Data ownership and interfaces are clear.
- [ ] Main success and failure flows are described.
- [ ] Trust boundaries, identity, permissions, and secrets are addressed.
- [ ] Deployment, monitoring, support, backup, and rollback are considered.
- [ ] Quality requirements map to design and tests.
- [ ] External technical facts are verified.
- [ ] Complexity is justified by requirements.

## Implementation-plan approval

- [ ] Outcome and scope match the milestone.
- [ ] Current and target states are understandable.
- [ ] Data, interface, security, and migration effects are known.
- [ ] Phases are ordered by dependencies and risk.
- [ ] Test approach proves important behavior.
- [ ] Deployment and rollback are credible.
- [ ] Observability and support are included.
- [ ] High-impact questions are resolved.

## Task Definition of Ready

- [ ] Objective is one concrete outcome.
- [ ] Requirements and design links are present.
- [ ] Scope and out-of-scope are explicit.
- [ ] Dependencies are complete.
- [ ] Acceptance criteria are observable.
- [ ] Validation commands or methods are stated.
- [ ] Security, data, interface, migration, and operations effects are understood.
- [ ] No blocking high-impact ambiguity remains.

## Task Definition of Done

- [ ] Acceptance criteria are met.
- [ ] Required checks actually ran and passed.
- [ ] Behavior changes have appropriate tests.
- [ ] Important failures and boundaries are handled.
- [ ] No known critical or high-severity defect was introduced.
- [ ] Relevant documentation is current.
- [ ] Changelog is updated only when appropriate.
- [ ] Task and handoff reflect actual state.
- [ ] Limitations and skipped checks are reported honestly.

## Independent change review

- [ ] Requirement and acceptance-criteria coverage
- [ ] Logic and data integrity
- [ ] Authentication, authorization, privacy, and audit
- [ ] Invalid input and error behavior
- [ ] Timeout, retry, duplicate, idempotency, and concurrency behavior
- [ ] Compatibility and migration safety
- [ ] Test quality, not merely test count
- [ ] Operational observability and support
- [ ] Unnecessary complexity
- [ ] Documentation drift

## Release readiness

- [ ] Milestone exit criteria are met.
- [ ] Must requirements have current evidence.
- [ ] Release artifact or revision is identified.
- [ ] Required tests and quality gates pass.
- [ ] Open defects and limitations are accepted.
- [ ] Security review is complete.
- [ ] Deployment and rollback are tested.
- [ ] Monitoring, alerts, ownership, and runbooks exist.
- [ ] Backup and restore are tested when applicable.
- [ ] User and support communications are ready.
- [ ] Changelog describes observable changes.
- [ ] A human owner accepts the release risk.

## Start-of-session quick check

- [ ] Read working agreement and index.
- [ ] Verify branch, revision, and uncommitted changes.
- [ ] Verify handoff against repository.
- [ ] Select one Ready task with complete dependencies.
- [ ] Load only linked context.

## End-of-session quick check

- [ ] Run required validation.
- [ ] Review the complete diff.
- [ ] Update task status.
- [ ] Update affected documents.
- [ ] Update handoff with exact evidence.
- [ ] State the safest next action.
