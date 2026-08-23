# Spec-driven project scaffold

This is the shared portion of a rendered runtime edition. `RUNTIME.md` identifies the installed coding-agent runtime and its work-plan command.

The repository is memory. Chat is not.

## What this is for

1. `docs/PROJECT.md` — the problem
2. `docs/user_journeys/` — including failure
3. `docs/REQUIREMENTS.md` — only what you can falsify
4. `docs/decisions/` — only expensive choices
5. `docs/ARCHITECTURE.md` — the shape those choices force
6. `docs/ROADMAP.md` — outcomes
7. `docs/plans/active/` — **the thing you approve**
8. The coding agent takes tasks from that plan
9. You inspect the product at each phase and merge into `main`

## Start

Replace `[PLACEHOLDERS]`. Delete files that answer no question you have.

Order for a new project:

- `docs/PROJECT.md`
- `docs/user_journeys/`
- `docs/REQUIREMENTS.md`
- `docs/ASSUMPTIONS.md` / `docs/RISKS.md` only if real uncertainty exists
- a decision record if reversal would hurt
- `docs/ARCHITECTURE.md`
- `docs/ROADMAP.md`
- one plan
- real setup, build, test, and run commands in `AGENTS.md`

Approve a layer before it feeds the next. **Draft / In Review / Approved / Superseded / Archived.**

## Small project

Collapse brief + journeys + requirements into `SPEC.md`. Collapse roadmap + tasks into one short plan. Keep decision records for irreversible choices. Keep tests.

## Ground rules

- You approve intent, irreversible choices, the plan, phases, and release.
- You do not Ready individual tickets.
- The agent may not invent Musts or silently grow the plan.
- A task is Done on the plan branch when its criteria and checks are true. Shipped means you merged the phase.
- If implementation disagrees with a specification, stop and change the specification on purpose.

## Roles and delivery

`AGENTS.md` is the working agreement. `agents/` are perspectives, not processes. `docs/WORK_PLAN.md` is the portable delivery-loop contract. `RUNTIME.md` explains how the selected runtime invokes that contract.

Do not add a UI/UX role file. If a user can see the change, exercise the UI.

## Map

```text
/
|-- AGENTS.md                 # shared working agreement
|-- RUNTIME.md                # selected runtime and invocation
|-- agents/                   # perspectives, not processes
|-- TASKS.md                  # queue the agent keeps
|-- HANDOFF.md                # current verified state
|-- CHANGELOG.md              # what a user would notice
|-- docs/
|   |-- INDEX.md
|   |-- WORK_PLAN.md          # canonical delivery loop
|   |-- PROJECT.md
|   |-- REQUIREMENTS.md
|   |-- ARCHITECTURE.md
|   |-- ROADMAP.md
|   |-- plans/active/         # primary human control surface
|   |-- decisions/
|   |-- reviews/              # durable findings and waivers only
|   `-- user_journeys/
|-- src/
|-- tests/
|-- scripts/
`-- ci/                       # same commands as AGENTS.md
```

## First use

- [ ] Read `RUNTIME.md`
- [ ] Fill in `docs/PROJECT.md`
- [ ] Delete optional docs you will not maintain
- [ ] Put real commands in `AGENTS.md`
- [ ] Approve the first requirements
- [ ] Define a walking-skeleton milestone
- [ ] Approve one implementation plan
- [ ] Protect `main`; no direct pushes
- [ ] Invoke the runtime's work-plan entry point

Fluent text is not evidence.
