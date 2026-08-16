# Contributing

Humans and Grok use the same rules.

## Before a change

1. It is in an Approved requirement, or it is an explicit discovery task.
2. It is in the Approved plan, or you stop and change the plan.
3. Read the ADRs and architecture the plan cites.

## Size

If you cannot review it as one thought, it is not a task. It is a plan.

## Delivery

Work on `plan/<milestone>-<slug>` off `v1`.

- One commit per task
- Message: outcome, then why, then what you ran
- Do not push to `v1`
- Phase done → one PR into `v1`
- The human looks at the product and merges

Do not open a GitHub issue per task. Do not make a Project board.

## Review

Implementer reviews their diff. Fresh context reviews the SHA when the plan asked. Security only on tasks the plan marked. UI: use it.

Self-review is fine. It is not independent. Do not file it as such.

## Validation

Commands live in `AGENTS.md`. CI runs the same list. Skipped = not done.

## Hygiene

- Unrelated changes are a different commit or a different task
- No secrets
- No history rewrites on shared branches

```text
<type>: <outcome>

Why:
- [reason]

Validation:
- [command — result]
```

Types: `feature`, `fix`, `docs`, `test`, `refactor`, `build`, `operations`.

## Docs

If the change made an Approved file false, the change is incomplete. Update the file in the same commit, or stop and raise a spec change.
