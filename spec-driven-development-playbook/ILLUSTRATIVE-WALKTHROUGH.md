# Walkthrough: checkout app (fictional)

A made-up internal tool, only to show the method. Not a real org, policy, or product.

## 1. Idea

Shared gear lives in a spreadsheet. Nobody trusts who has what. We want a small checkout app.

## 2. Brief (excerpt)

```text
Problem:
People hunt for gear because the spreadsheet is stale and has no custody history.

Users: borrower, coordinator, admin

OUT-001: An authorized person can see who has an item and whether it is free.

In: register, check out, return, current custody + basic history
Out: purchasing, valuation, public access, mobile app

A-001: One coordinator can settle disputes during the pilot.
```

No language, no database, no host. Good.

## 3. Journey (excerpt)

```text
UJ-001: Borrow an available item
Preconditions: signed in; item exists and is free
Main path: search -> available -> checkout -> record borrower/time/due -> shown as out
F1: someone else wins the race -> reject, show current state, no second active checkout
P1: no borrow permission -> can see availability, cannot check out
```

## 4. Requirements (excerpt)

```text
FR-001: Authorized borrower can check out an available item.
  AC: one active checkout; item unavailable
  AC: unavailable item -> reject, no second active checkout

SEC-001: Deny checkout without borrow permission.
DATA-001: At most one active checkout per item.
OPS-001: Record failed checkouts for diagnosis. No secrets in logs.
```

"The system must be secure" would have been deleted here.

## 5. The one decision that earned a record

```text
How do we stop two active checkouts on one item?
```

That is data + concurrency. It is worth an ADR. "Use Postgres" is not a requirement; it might be the decision.

## 6. Architecture (excerpt)

```text
Web UI -> app service (rules + permissions) -> data (items, checkouts)
Identity provider authenticates.

Checkout: check permission -> atomic checkout -> conflict or one row -> audit.
```

Still conceptual.

## 7. Roadmap

```text
M-01 Walking skeleton
  Build, test, run, one test user, read one sample item.

M-02 Pilot checkout
  Pilot users check out and return. Duplicate active checkout is impossible.
```

## 8. Plan for M-02 (what you approve)

```text
Branch: plan/M-02-checkout
Reviews: tests always; security on auth + checkout-integrity tasks; UI when the screen exists
Stops: new store semantics, new identity provider, any Must we cannot test

Phase 1 — state exists
  Model item + checkout. Integrity tests. You can run the tests.

Phase 2 — the rule is real
  Authorization + atomic checkout. Conflict result. You can hit the rule in a test.

Phase 3 — a person can do it
  UI + conflict message. You click it.

Phase 4 — we can see failure
  Audit, a health check, demo script.
```

You approve **this**. You do not Ready T-014.

## 9. One task (fuel)

```text
T-014: Enforce one active checkout per item
Plan: PLAN-002 / Phase 2
FR-001, DATA-001, ADR-0003
Depends: T-012
Reviews: test (always); security (plan marked this one)

AC:
- one valid request -> one active checkout
- repeat -> no second row
- race -> exactly one winner, loser gets conflict
- tests pass
```

Grok picks this when T-012 is Done. You are not in the queue.

## 10. Delivery

Grok on `plan/M-02-checkout`:

1. Implements T-014, adds race tests, runs them
2. Fresh test review on the SHA
3. Security diff because the plan said so
4. Fixes what those found
5. Commits. Does not merge to `v1`.
6. Next task until Phase 2's proof exists
7. Stops. Handoff says: run these tests; here is the conflict case.

You run it. Then PR → `v1`, or continue to Phase 3.

## 11. Trace

```text
OUT-001 -> UJ-001 -> FR-001/SEC-001/DATA-001
        -> ADR-0003 -> checkout flow
        -> M-02 / PLAN-002 / Phase 2 -> T-014 -> CheckoutIntegrityTests
```

## 12. When the store cannot do the thing

Do not soften the test.

Record the evidence. Supersede the ADR. Change architecture and plan. Then continue. The loop is allowed to stop. It is not allowed to lie.
