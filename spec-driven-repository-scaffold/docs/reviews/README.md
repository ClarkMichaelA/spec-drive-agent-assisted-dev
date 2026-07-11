# Review Records

Use this directory for structured reviews that should remain part of project history, such as requirements review, architecture review, security review, release readiness, or a post-implementation review.

A review record should identify the exact task, artifact, branch, revision, or commit reviewed when available. It should also identify the reviewer role, reviewer identity or assistant label, and whether the work was an independent review, self-review, or another non-independent review.

Suggested task-review filenames include:

- `T-014-test-review.md`
- `T-014-security-review.md`
- `T-014-documentation-review.md`

Use [`REVIEW-000-template.md`](REVIEW-000-template.md) and record:

- Scope reviewed
- Evidence and checks performed
- Findings and required corrections
- Owners and disposition
- Reverification result
- Approval status

Avoid vague statements such as "looks good" without evidence. Absence of findings does not by itself prove correctness or security.
