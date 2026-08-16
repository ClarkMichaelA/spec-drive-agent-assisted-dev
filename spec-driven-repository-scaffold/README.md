# Spec-driven project scaffold

Copy this folder. It is a Grok Build project: you steer the plan, Grok burns the tasks.

Specs are Markdown. Another assistant can read them. The delivery loop is `/work-plan`.

## What this is for

The repo is memory. Chat is not.

1. `docs/PROJECT.md` — the problem
2. `docs/user_journeys/` — including failure
3. `docs/REQUIREMENTS.md` — only what you can falsify
4. `docs/decisions/` — only expensive choices
5. `docs/ARCHITECTURE.md` — the shape those choices force
6. `docs/ROADMAP.md` — outcomes
7. `docs/plans/active/` — **the thing you approve**
8. Grok takes tasks from that plan
9. You look at the product at each phase and merge into `v1`

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
- fill in the real commands in `AGENTS.md`

Approve a layer before it feeds the next. **Draft / In Review / Approved / Superseded / Archived.**

## Small project

Collapse brief + journeys + requirements into `SPEC.md`. Collapse roadmap + plan + tasks into one short plan. Keep ADRs for irreversible choices. Keep tests.

## Ground rules

- You approve intent, irreversible choices, the plan, phases, release.
- You do not Ready tickets.
- Grok may not invent Musts or silently grow the plan.
- A task is Done on the plan branch when criteria and checks are true. Shipped = you merged the phase.
- If implementation disagrees with a spec, stop and change the spec on purpose.

## Roles

`AGENTS.md` is the contract. `agents/` are perspectives. They do not start processes.

`/work-plan` is the orchestrator: next task → test → the reviews the plan asked for → commit → repeat until a phase or a stop.

Do not add a UI/UX role file. If a user can see the change, exercise the UI.

## Map

```text
/
|-- AGENTS.md                 # Grok reads this
|-- .grok/workflows/work-plan.rhai
|-- agents/                   # perspectives, not processes
|-- TASKS.md                  # queue the agent keeps
|-- HANDOFF.md                # now
|-- CHANGELOG.md              # what a user would notice
|-- docs/
|   |-- INDEX.md
|   |-- PROJECT.md
|   |-- REQUIREMENTS.md
|   |-- ARCHITECTURE.md
|   |-- ROADMAP.md
|   |-- plans/active/         # you live here
|   |-- decisions/
|   |-- reviews/              # rare: findings that must survive
|   `-- user_journeys/
|-- src/
|-- tests/
|-- scripts/
`-- ci/                       # same commands as AGENTS.md
```

## First use

- [ ] Copy, rename, `git init`
- [ ] `docs/PROJECT.md`
- [ ] Delete optional docs you will not maintain
- [ ] Real commands in `AGENTS.md`
- [ ] First Approved requirements
- [ ] Walking-skeleton milestone
- [ ] One Approved plan
- [ ] Protect `v1`. No direct pushes.
- [ ] `/work-plan` (keep `.grok/workflows/`) or the plan prompt in the playbook

Fluent is not evidence.
