# Spec-Driven, Agent-Assisted Development

A vendor-neutral starter kit for turning a software idea into an implementable, testable, and maintainable project with help from AI assistants.

This repository combines two resources:

- A **project scaffold** containing practical templates for specifications, decisions, plans, tasks, reviews, testing, and handoffs.
- A **plain-language playbook** explaining when to create each artifact, what humans should review, and how to use AI without making chat history the project's source of truth.

Use the whole system for a substantial project, or start with the minimum viable workflow and add rigor only when the risk justifies it. The materials do not depend on a particular AI vendor, programming language, source-control host, or deployment platform.

## Why use it?

AI can produce code quickly, but speed is not the same as shared understanding or evidence. This toolkit helps a team keep:

- Product intent separate from implementation details.
- Requirements observable and testable.
- Assumptions, risks, and consequential decisions visible.
- Work small enough to review and verify.
- Code, tests, plans, and project status aligned.
- Durable project memory in the repository instead of one long conversation.

The core loop is:

```text
Idea -> project brief -> user journeys -> requirements -> decisions and architecture
     -> roadmap -> implementation plan -> small tasks -> code and tests
     -> review and release -> learning and specification updates
```

This is a feedback loop, not a one-way waterfall. If implementation disproves an assumption or testing exposes an ambiguous requirement, update the affected source document deliberately and trace the impact.

## Repository contents

| Resource | What it provides | Start here |
| --- | --- | --- |
| [`spec-driven-repository-scaffold/`](spec-driven-repository-scaffold/) | A ready-to-copy project structure with templates, AI working agreements, specialized roles, review records, and placeholders for code and automation | [Scaffold README](spec-driven-repository-scaffold/README.md) |
| [`spec-driven-development-playbook/`](spec-driven-development-playbook/) | Lifecycle guidance, review gates, reusable prompts, checklists, examples, failure modes, and scaling advice | [Playbook README](spec-driven-development-playbook/README.md) |

There is nothing to install or build in this repository; its contents are Markdown templates and guidance.

## Quick start

### 1. Copy the scaffold into your project

For a new project on macOS or Linux:

```bash
mkdir my-project
cp -R spec-driven-repository-scaffold/. my-project/
cd my-project
git init
```

For a new project in PowerShell:

```powershell
New-Item -ItemType Directory my-project
Get-ChildItem -Force spec-driven-repository-scaffold |
  Copy-Item -Destination my-project -Recurse
Set-Location my-project
git init
```

For an existing project, copy the files selectively and review conflicts first, especially `README.md`, `.gitignore`, `AGENTS.md`, and `CONTRIBUTING.md`.

### 2. Define the project before asking for code

Complete [`docs/PROJECT.md`](spec-driven-repository-scaffold/docs/PROJECT.md). Replace bracketed placeholders, delete sections that genuinely do not apply, and clearly label anything still unknown or assumed.

Then ask an assistant to critique the brief rather than immediately implement it. For example:

```text
Read AGENTS.md and docs/PROJECT.md. Act as a project analyst.
Identify ambiguous scope, unverifiable outcomes, hidden assumptions, missing users,
external facts that need verification, and questions that must be answered before
requirements are drafted. Do not write code or invent answers.
```

### 3. Build the specification in reviewable layers

Use this order for a typical project:

1. [`PROJECT.md`](spec-driven-repository-scaffold/docs/PROJECT.md) — problem, users, outcomes, scope, and constraints.
2. [`user_journeys/`](spec-driven-repository-scaffold/docs/user_journeys/) — realistic user and system behavior, including failure paths.
3. [`REQUIREMENTS.md`](spec-driven-repository-scaffold/docs/REQUIREMENTS.md) — testable functional and quality requirements.
4. [`ASSUMPTIONS.md`](spec-driven-repository-scaffold/docs/ASSUMPTIONS.md) and [`RISKS.md`](spec-driven-repository-scaffold/docs/RISKS.md) — uncertainty and its treatment.
5. [`decisions/`](spec-driven-repository-scaffold/docs/decisions/) and [`ARCHITECTURE.md`](spec-driven-repository-scaffold/docs/ARCHITECTURE.md) — important choices and the accepted system design.
6. [`ROADMAP.md`](spec-driven-repository-scaffold/docs/ROADMAP.md) — outcome-based milestones.
7. [`plans/active/`](spec-driven-repository-scaffold/docs/plans/active/) — one bounded plan for the active milestone or feature.
8. [`TASKS.md`](spec-driven-repository-scaffold/TASKS.md) — small units of work with acceptance criteria and validation.

Review each major layer before using it as input to the next. Mark planning documents as **Draft**, **In Review**, **Approved**, **Superseded**, or **Archived** so assistants and people know what is authoritative.

### 4. Customize the assistant working agreement

Update [`AGENTS.md`](spec-driven-repository-scaffold/AGENTS.md) with the project's real:

- Purpose, users, constraints, and boundaries.
- Setup, build, formatting, analysis, and test commands.
- Security and data-handling rules.
- Definition of done and required evidence.
- Areas that require explicit human approval.

Portable role definitions live in [`agents/`](spec-driven-repository-scaffold/agents/). They focus a session on analysis, architecture, implementation, testing, security, or documentation; they do not grant additional authority or automatically create independent reviewers.

### 5. Deliver one bounded task at a time

A useful implementation prompt is:

```text
Read AGENTS.md, the approved requirements and architecture, the active plan,
and TASKS.md. Complete only the selected Ready task. Preserve its scope,
run the required checks, record validation evidence, update affected project
documents, TASKS.md, and HANDOFF.md, then stop. If a high-impact ambiguity
cannot be resolved from the repository, stop and ask instead of guessing.
```

Treat a task as complete only when its acceptance criteria are met and its required checks pass—not merely when code has been written.

## Minimum viable workflow

For a small, low-risk experiment, begin with:

- One `SPEC.md` combining the project brief, key journeys, and testable requirements.
- Decision records only for choices that are costly to reverse.
- One short delivery plan with a small task list.
- Automated tests appropriate to the risk.
- `HANDOFF.md` recording current state and the next safe action.

Split out security, operations, data, API, roadmap, and other documents when the system's complexity, lifespan, number of contributors, or risk makes them useful. Documentation is a control surface, not a paperwork quota.

## Human review gates

AI is well suited to drafting, organizing, critiquing, implementing, testing, and summarizing. Humans remain accountable for approving:

- The real problem, desired outcomes, scope, and priorities.
- Business rules and claims about external systems or users.
- Security, privacy, compliance, cost, and operational risk.
- Consequential or difficult-to-reverse decisions.
- Whether test and review evidence is sufficient to release.

Fluent output is not evidence. Verify claims about laws, APIs, products, security controls, performance, and external systems against authoritative sources before approving them.

## Practical resources

- [Lifecycle at a glance](spec-driven-development-playbook/01-LIFECYCLE-AT-A-GLANCE.md) — the full process on one page.
- [Prompt library](spec-driven-development-playbook/PROMPT-LIBRARY.md) — copy-ready prompts for each stage.
- [Sample session sequence](spec-driven-development-playbook/SAMPLE-SESSION-SEQUENCE.md) — a practical order for AI-assisted work sessions.
- [Illustrative walkthrough](spec-driven-development-playbook/ILLUSTRATIVE-WALKTHROUGH.md) — a fictional end-to-end trace from outcome to test.
- [Review and stage-gate checklists](spec-driven-development-playbook/CHECKLISTS.md) — concise checks for approving work.
- [Specialized agent roles](spec-driven-development-playbook/SPECIALIZED-AGENT-ROLES.md) — how to select, bound, and review role-focused work.
- [Common failure modes](spec-driven-development-playbook/11-COMMON-FAILURE-MODES.md) — warning signs and corrective actions.
- [Scaling the process](spec-driven-development-playbook/12-SCALING-THE-PROCESS.md) — how to adjust the workflow for solo and parallel work.
- [Glossary](spec-driven-development-playbook/GLOSSARY.md) — plain-language definitions.

## Common questions

### Must every project use every template?

No. Use the smallest set that preserves clarity, safety, and project memory. Remove genuinely unnecessary files or sections instead of maintaining empty placeholders.

### Does this require multiple AI agents?

No. One assistant session can use the same workflow. Separate sessions, models, tools, or human reviewers are useful when a review must be genuinely independent.

### Can specifications change after implementation starts?

Yes. Record the discovery, update the source artifact, assess downstream impact, obtain the appropriate approval, and then update the plan or task. Do not silently let the implementation redefine the requirement.

### Where should current project state live?

Use `TASKS.md` for executable work and evidence, `HANDOFF.md` for the current operational state and next action, decision records for consequential choices, and the relevant approved document for product or technical truth. Chat history is supporting context, not durable state.

## License

This repository currently does not include a license. Add or confirm an appropriate license before redistributing or incorporating the material into another publicly distributed project.
