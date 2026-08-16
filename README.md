# Spec-Driven, Agent-Assisted Development

A Grok Build starter kit for turning a software idea into something you can run, test, and change without losing the plot.

Two pieces:

- **Scaffold** — the files a real project should start with
- **Playbook** — when to write each one, what you actually have to look at, and what to delete

Built for a one-person team that wants Grok to do the work. You steer the plan. The repo is memory. Chat is not.

The Markdown still works if you use another assistant. The loop is written for Grok Build.

## The idea

Agents are cheap. Your attention is not.

Spend judgment on: the problem, the hard decisions, the plan, and whether the running software is right.

Do not spend it on: Ready-ing tickets, renaming columns, or reading a review file that says "looks good."

```text
Idea
  -> brief
  -> journeys
  -> requirements
  -> only the decisions that are expensive to reverse
  -> architecture that those decisions force
  -> outcome roadmap
  -> one implementation plan (phases + tasks)
  -> Grok burns the plan down, one task at a time
  -> you inspect the product at each phase
  -> merge, or change the plan
```

If implementation proves a requirement wrong, change the requirement on purpose. Do not let the code silently become the spec.

## What's in here

| Resource | What it is | Start |
| --- | --- | --- |
| [`spec-driven-repository-scaffold/`](spec-driven-repository-scaffold/) | Copy this. Working agreement, roles, plan template, Grok workflow. | [Scaffold README](spec-driven-repository-scaffold/README.md) |
| [`spec-driven-development-playbook/`](spec-driven-development-playbook/) | How to use it. What to ignore. | [Playbook README](spec-driven-development-playbook/README.md) |

Nothing to install. These are files.

## Quick start

### 1. Copy the scaffold

```powershell
New-Item -ItemType Directory my-project
Get-ChildItem -Force spec-driven-repository-scaffold |
  Copy-Item -Destination my-project -Recurse
Set-Location my-project
git init
```

macOS / Linux:

```bash
mkdir my-project
cp -R spec-driven-repository-scaffold/. my-project/
cd my-project
git init
```

If the project already exists, copy selectively. Watch `README.md`, `.gitignore`, `AGENTS.md`, `CONTRIBUTING.md`, and `.grok/` (`/work-plan` lives there).

### 2. Write the brief. Do not write code.

Fill in [`docs/PROJECT.md`](spec-driven-repository-scaffold/docs/PROJECT.md). Delete sections that do not apply. Label guesses as guesses.

Then:

```text
Read AGENTS.md and docs/PROJECT.md. Act as the Project Analyst.
Find invented facts, fake constraints, outcomes that are actually features,
and questions that must be answered before requirements. Do not write code.
```

### 3. Spec in layers. Approve a layer before it feeds the next.

1. [`PROJECT.md`](spec-driven-repository-scaffold/docs/PROJECT.md) — problem, users, outcome, non-goals
2. [`user_journeys/`](spec-driven-repository-scaffold/docs/user_journeys/) — including failure
3. [`REQUIREMENTS.md`](spec-driven-repository-scaffold/docs/REQUIREMENTS.md) — testable. Delete anything you cannot falsify.
4. [`ASSUMPTIONS.md`](spec-driven-repository-scaffold/docs/ASSUMPTIONS.md) / [`RISKS.md`](spec-driven-repository-scaffold/docs/RISKS.md) — only if there is real uncertainty
5. [`decisions/`](spec-driven-repository-scaffold/docs/decisions/) + [`ARCHITECTURE.md`](spec-driven-repository-scaffold/docs/ARCHITECTURE.md) — only expensive choices
6. [`ROADMAP.md`](spec-driven-repository-scaffold/docs/ROADMAP.md) — outcomes, not a component shopping list
7. [`plans/active/`](spec-driven-repository-scaffold/docs/plans/active/) — one plan. Phases are your checkpoints. Tasks are fuel.

Statuses that matter: **Draft**, **In Review**, **Approved**, **Superseded**, **Archived**.

### 4. Fill in the real commands

Put actual setup / build / test commands in [`AGENTS.md`](spec-driven-repository-scaffold/AGENTS.md). If a command is not real, say so. Do not leave a placeholder that looks like a check.

### 5. Approve the plan. Let Grok run.

You do not Ready individual tasks. You approve the plan. Then in Grok Build:

```text
The plan at [PATH] is Approved. Work it until the next phase checkpoint.
Follow AGENTS.md. Stop if the plan is wrong.
```

Or run `/work-plan` from the copied scaffold.

A task is finished when its acceptance criteria are met on the plan branch and the required checks actually ran. It is not shipped until you merge the phase into `v1`.

## Minimum

If the project is small and low-risk:

- One `SPEC.md` (brief + journeys + requirements)
- ADRs only for choices that hurt to undo
- One short plan with phases and a task list
- Tests for the risky claims
- `HANDOFF.md`

Do not create `SECURITY.md`, `OPERATIONS.md`, `API.md`, `DATA_MODEL.md`, or `TRACEABILITY.md` because the template exists.

## What you still own

- The problem, scope, and non-goals
- Business rules and claims about the outside world
- Security, data, and irreversible choices
- Whether the running software is acceptable
- Merge to `v1` and release

Fluent text is not evidence. Check laws, APIs, products, and numbers at the source before you approve them.

## Read next

- [Lifecycle](spec-driven-development-playbook/01-LIFECYCLE-AT-A-GLANCE.md)
- [The delivery loop](spec-driven-development-playbook/07-IMPLEMENTATION-LOOP.md)
- [Prompts](spec-driven-development-playbook/PROMPT-LIBRARY.md)
- [Failure modes](spec-driven-development-playbook/11-COMMON-FAILURE-MODES.md)
- [How much process](spec-driven-development-playbook/12-SCALING-THE-PROCESS.md)

## Common questions

**Every template?** No. Delete empty ones.

**Many agents?** No. One Grok session plus fresh reviewer subagents when a review has to disagree with the implementer. Role files do not spawn processes.

**Specs after code starts?** Yes, if you change them on purpose.

**GitHub Projects / an issue per task?** No. The plan is the board. A PR is how a phase lands. Add Issues only when you have more than one human.

## License

[MIT](LICENSE). Keep the copyright notice if you copy a substantial portion. That is the attribution.
