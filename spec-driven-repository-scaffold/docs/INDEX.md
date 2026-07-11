# Documentation Index

Status: Draft  
Owner: `[OWNER]`  
Last reviewed: `[YYYY-MM-DD]`

This page is the map for project knowledge. Keep it short enough that a new contributor or AI assistant can use it to find the right source without loading every document.

## Read first

1. `PROJECT.md` - why the project exists and what is in scope
2. `user_journeys/` - how people are expected to use it
3. `REQUIREMENTS.md` - what the system must do and how well it must do it
4. `ARCHITECTURE.md` - how the accepted design is structured
5. `ROADMAP.md` - which outcomes are delivered in what order
6. `../TASKS.md` - the current executable work queue
7. `../HANDOFF.md` - the latest operational state

## Source-of-truth documents

| Topic | Authoritative file | Notes |
|---|---|---|
| Problem, users, scope, success | `PROJECT.md` | Human-approved product intent |
| User scenarios | `user_journeys/` | Index in `user_journeys/README.md`; one file per journey |
| Functional and quality requirements | `REQUIREMENTS.md` | Requirements have stable IDs |
| Accepted consequential choices | `decisions/` | One decision per record |
| Current technical design | `ARCHITECTURE.md` | Must reflect accepted decisions |
| Delivery milestones | `ROADMAP.md` | Outcome-based, not a task dump |
| Current implementation approach | `plans/active/` | One active plan per major workstream unless parallel work is intentional |
| Work queue | `../TASKS.md` | Only Ready tasks are selected automatically |
| Session continuity | `../HANDOFF.md` | Verify against repository state |
| Security and privacy | `SECURITY.md` | Threats, controls, tests, and ownership |
| Operations and recovery | `OPERATIONS.md` | Deployment, monitoring, backup, rollback, and runbooks |
| Test approach | `TEST_STRATEGY.md` | Test layers, quality gates, and evidence |
| Data concepts | `DATA_MODEL.md` | Ownership, lifecycle, retention, and migrations |
| Interfaces | `API.md` | Use only if the project exposes or consumes interfaces |
| Risks | `RISKS.md` | Active risk treatment and ownership |
| Assumptions | `ASSUMPTIONS.md` | Unverified beliefs with validation plans |
| Traceability | `TRACEABILITY.md` | Links goals to delivery evidence |

## Active documents

- Active plan: `[docs/plans/active/PLAN-000-name.md]`
- Current review: `[docs/reviews/REVIEW-000-name.md OR NONE]`
- Current milestone: `[M-00 - NAME]`

## Optional documents

Delete or mark these as not applicable when they add no value:

- `API.md`
- `DATA_MODEL.md`
- Separate `SECURITY.md`, `OPERATIONS.md`, or `TEST_STRATEGY.md` for a very small prototype
- Formal `TRACEABILITY.md` for low-risk experiments

## Maintenance rule

When a new durable document is added, place it here and state what question it answers. Do not create multiple authoritative files for the same topic.
