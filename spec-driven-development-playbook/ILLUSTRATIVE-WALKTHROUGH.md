# Illustrative Walkthrough: From Idea to Ready Task

This is a fictional, simplified example created only to demonstrate the method. It is not a claim about any real organization, policy, system, or product.

## 1. Rough idea

A small team tracks shared equipment in a spreadsheet. People cannot reliably tell who has an item or when it is due back. The project idea is a small internal checkout application.

## 2. Project brief excerpt

```text
Problem:
Team members spend time searching for shared equipment because the current
spreadsheet is frequently stale and does not show a trustworthy custody history.

Primary users:
- Borrowers
- Equipment coordinator
- Support administrator

Outcome OUT-001:
An authorized user can determine the current custody and availability of an item.

Initial scope:
- Register an item
- Check an available item out to an authorized borrower
- Return an item
- View current custody and basic history

Non-goals:
- Purchasing
- Inventory valuation
- Public access
- Mobile application

Assumption A-001:
One coordinator can resolve disputed custody records during the pilot.
```

Notice that the brief does not yet choose a programming language, database, or hosting platform.

## 3. Journey excerpt

```text
UJ-001: Borrow an available item

Actor: Authorized borrower
Trigger: The borrower needs an item for approved work.
Preconditions:
- The borrower is signed in.
- The item exists and is available.

Main path:
1. Borrower searches for the item.
2. System shows it as available.
3. Borrower requests checkout.
4. System records borrower, item, checkout time, and expected return date.
5. System shows the item as checked out.

Failure path F1:
Another user checks out the item after the search but before confirmation.
The system rejects the second checkout, shows the current state, and does not
create a duplicate active checkout.

Permission path P1:
A user without borrowing permission may view availability but may not check out.
```

## 4. Requirements excerpt

```text
FR-001:
The system shall allow an authorized borrower to check out an available item.

Acceptance criteria:
- Given an available item and an authorized borrower, when checkout is
  confirmed, then one active checkout is recorded and the item becomes unavailable.
- Given an unavailable item, when another checkout is attempted, then the
  operation is rejected and no second active checkout is created.

SEC-001:
The system shall deny checkout to a user who lacks borrowing permission.

DATA-001:
The system shall preserve at most one active checkout for an item.

OPS-001:
The system shall record failed checkout attempts needed to diagnose conflicts
without logging authentication secrets.
```

## 5. Decision-record candidate

Decision question:

```text
How will the system enforce that one item cannot have two active checkouts?
```

This may deserve a decision record because data consistency and concurrent requests affect design. The record would compare realistic options and select one based on `DATA-001`, scale, operational simplicity, and the chosen data platform.

## 6. Architecture excerpt

```text
Components:
- Web interface: accepts user actions and shows item state
- Application service: enforces checkout and permission rules
- Data store: owns items, borrowers, and checkout records
- Identity provider: authenticates users and supplies identity attributes

Checkout flow:
1. Interface sends borrower and item request to application service.
2. Application service verifies permission.
3. Application service requests an atomic checkout operation from the data layer.
4. Data layer either creates one active checkout or reports a conflict.
5. Application service returns the result and records an appropriate audit event.
```

The architecture is still conceptual. Detailed technology is chosen only when required and recorded.

## 7. Roadmap excerpt

```text
M-01: Walking skeleton
Outcome: A developer can build, test, run, and deploy a minimal application
that authenticates a test user and reads one sample item.

M-02: Controlled checkout pilot
Outcome: Authorized pilot users can check out and return items while the system
prevents duplicate active checkout and records basic history.
```

## 8. Implementation-plan excerpt for M-02

```text
Phase 1: Model item and checkout state; add integrity tests.
Phase 2: Implement authorization and atomic checkout behavior.
Phase 3: Add user interface and conflict feedback.
Phase 4: Add audit, monitoring, deployment checks, and pilot demonstration.
```

## 9. Ready task example

```text
T-014: Enforce one active checkout per item

Requirements: FR-001, DATA-001
Decision: ADR-0003
Plan: PLAN-002
Depends on: T-012

Objective:
Ensure concurrent or repeated requests cannot create two active checkout records
for the same item.

Scope:
- Implement the approved data-integrity mechanism.
- Return a typed conflict result.
- Add success, duplicate, and concurrent-attempt tests.

Out of scope:
- User-interface wording
- Return processing
- Notifications

Acceptance criteria:
- One valid request creates one active checkout.
- A repeated request creates no additional active checkout.
- Competing requests leave exactly one active checkout.
- The losing request receives a conflict result.
- Required tests and full validation pass.
```

## 10. Traceability

```text
OUT-001
  -> UJ-001
  -> FR-001, SEC-001, DATA-001, OPS-001
  -> ADR-0003
  -> Architecture checkout flow
  -> M-02 / PLAN-002
  -> T-014
  -> CheckoutIntegrityTests
```

This chain makes it possible to explain why the task exists and what evidence proves it.

## 11. Implementation discovery example

Suppose implementation reveals that the selected data store cannot enforce the intended integrity rule in the approved deployment mode. The correct response is not to weaken the test silently.

Instead:

1. Record the evidence.
2. Reopen or supersede the decision record.
3. Analyze alternatives.
4. Update architecture and plan after approval.
5. Adjust tasks and tests.
6. Continue from the new approved state.
