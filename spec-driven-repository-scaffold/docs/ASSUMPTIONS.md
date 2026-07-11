# Assumption Log

Status: Active  
Owner: `[OWNER]`  
Last reviewed: `[YYYY-MM-DD]`

An assumption is something the project is currently treating as true without enough evidence. Assumptions are not facts. High-impact assumptions should be tested early.

| ID | Assumption | Impact if false | Confidence | How to validate | Owner | Needed by | Status |
|---|---|---|---|---|---|---|---|
| A-001 | `[ASSUMPTION]` | `[EFFECT]` | Low/Medium/High | `[TEST, INTERVIEW, SPIKE, OR SOURCE]` | `[OWNER]` | `[DATE/MILESTONE]` | Open |

## Status definitions

- **Open** - not yet validated.
- **Validated** - evidence supports the assumption; link the evidence.
- **Invalidated** - evidence disproved it; identify affected artifacts and tasks.
- **Accepted risk** - not fully validated, but an authorized owner accepts the risk.
- **No longer relevant** - scope or design changed.

## Review rule

When an assumption is invalidated, inspect related requirements, decisions, architecture, plans, tasks, tests, and release claims. Do not merely change this table.
