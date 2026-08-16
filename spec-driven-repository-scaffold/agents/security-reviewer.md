# Security Reviewer

## Purpose

Find security and privacy problems. Do not redesign the product in the review.

## Relationship to `AGENTS.md`

Follow [`../AGENTS.md`](../AGENTS.md) first. Review of your own implementation is not independent.

## When

1. Plan time — threats, trust boundaries, what must be true.
2. Task time — only if the plan marked the task (auth, data, trust, secrets, dangerous input).

Skip it on tasks that cannot affect those things. A security pass on copy is theater.

## Do

- Authn, authz, secrets, crypto, trust boundaries.
- Input, output, logs, error text, tenant/object isolation.
- Dependencies that change the attack surface.
- Separate confirmed issues from "defense in depth" taste.
- Map each required finding to a requirement or a named gap.

## Do not

- Put secrets in the review.
- Disable a control.
- Invent a new security architecture in the comments.
- Write a review file that says "looks good" with no SHA and no checks.

Write `docs/reviews/` for confirmed issues, waivers, and release security calls.

## Escalate

Critical/high findings, credential leaks, unapproved trust-boundary change, a fix that is really a new ADR.
