# 8. Test, Review, and Release

## Code is not evidence by itself

Completion requires evidence that the intended behavior works and that important failure, security, data, and operational paths are acceptable.

## Build a layered test approach

Possible layers include:

- Static analysis and formatting
- Unit tests
- Component tests
- Integration and contract tests
- End-to-end journey tests
- Security and permission tests
- Performance and capacity tests
- Deployment, rollback, restore, and runbook tests

Use the layers needed for credible evidence. Do not duplicate every behavior at every layer.

## Convert written rules into automated checks

A sentence saying "always run tests" is helpful. An automated gate that blocks an invalid change is stronger.

Automate objective checks such as:

- Build
- Formatting
- Type or static analysis
- Unit and integration tests
- Dependency and security scanning
- API or schema compatibility
- Documentation links
- Migration validation
- Packaging integrity

Keep local and automated commands as similar as possible.

## Review in two passes

### Implementation self-review

The implementing AI checks its own diff against:

- Task acceptance criteria
- Requirements
- Architecture
- Security rules
- Project conventions
- Tests and documentation

### Independent review

A separate context challenges the change without being anchored to the implementation choices.

Ask it for findings with evidence, severity, impact, and a specific correction. Require it to distinguish defects from optional improvements.

Select the review perspective required by the task:

- Test Engineer for behavior, acceptance criteria, and test quality
- Security Reviewer for meaningful security or privacy effects
- Documentation Reviewer for source-of-truth consistency and traceability

Role selection alone does not establish independence. Record whether the review was independent, a self-review, or otherwise non-independent.

## Record reviews durably

Use `docs/reviews/` for required task reviews. A review record should identify the task or artifact, exact branch or revision when available, reviewer role, reviewer identity or assistant label, independence status, scope, evidence, findings, required actions and owners, disposition, reverification result, and approval status.

Required reviews must be complete or explicitly waived by an authorized person before a task is Done. If a finding requires correction, return the task to an appropriate non-Done status and reverify the corrected revision. Absence of findings does not by itself prove correctness or security.

## Release readiness is broader than task completion

Before release, confirm:

- Milestone exit criteria are met.
- Must requirements have evidence.
- Required tests pass on the release revision or artifact.
- Known limitations are visible and accepted.
- Security review is complete for the risk level.
- Deployment and rollback are tested or otherwise proven.
- Monitoring, logs, alerts, ownership, and runbooks exist.
- Backup and restore are tested when applicable.
- User and support communication is ready.
- Changelog entries describe meaningful observable changes.

## Copy-ready independent review prompt

```text
Act as the [REVIEW ROLE] defined in [ROLE FILE]. Perform an independent review.
Do not assume the implementation is correct.

Read task [T-000], its linked requirements, accepted decisions, architecture,
security rules, test strategy, and revision [REVISION] with its complete proposed
diff or changed files.

Find:
- Unmet acceptance criteria
- Logic or data-integrity defects
- Security, privacy, or authorization problems
- Missing failure and recovery handling
- Concurrency, duplicate, retry, or idempotency problems where relevant
- Compatibility or migration risk
- Weak, misleading, or missing tests
- Unnecessary complexity
- Documentation drift

For each finding provide severity, evidence, impact, and a concrete correction.
Separate required findings from optional improvements. Do not invent project
requirements. State when evidence is insufficient. Record the review under
docs/reviews/ and link it from TASKS.md and HANDOFF.md where applicable.
```

## Copy-ready release-readiness prompt

```text
Read the approved milestone, requirements, traceability map, active/completed
plan, task queue, test results, security and operations documents, changelog,
and release candidate revision.

Perform a release-readiness review. Do not modify files yet.

Return:
1. Requirements and milestone criteria proven by evidence
2. Missing, failed, stale, or unverifiable evidence
3. Open defects, risks, assumptions, and accepted limitations
4. Security, deployment, rollback, monitoring, backup, and support readiness
5. Changelog and communication gaps
6. A recommendation: Ready, Ready with explicit conditions, or Not Ready
7. Required actions with owners before release

Do not treat task status or a handoff statement as proof without test, review,
or observable evidence.
```

## Release decision

The AI can assemble evidence and identify gaps. A responsible human owner accepts the release risk, especially when the change affects security, money, personal data, production availability, or irreversible data.
