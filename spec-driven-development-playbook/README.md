# Plain-Language Playbook for Spec-Driven, Agent-Assisted Development

This guide explains how to take a software idea from initial concept to a tested, reviewable delivery while using AI assistants efficiently and safely.

It assumes you are still learning the process. The goal is not to turn you into a project manager or software architect before you can begin. The goal is to give you a repeatable path, tell you what to review, and provide prompts you can reuse.

The guide is vendor-neutral. Use it with any capable language model, chat assistant, coding assistant, or agent that can read the files in your project.

## The central idea

Use AI to do the repetitive work of expanding, organizing, checking, planning, implementing, testing, and summarizing. Keep human control over:

- The real problem being solved
- Scope and priorities
- Business rules and external facts
- Security and risk tolerance
- Important tradeoffs
- Approval of requirements and architecture
- Acceptance of release risk

The project repository should be the durable memory. Do not depend on one long chat to remember decisions or project state.

## The lifecycle

```text
Idea
  -> Project brief
  -> User journeys and scenarios
  -> Requirements
  -> Decision records and architecture
  -> Outcome-based roadmap
  -> Milestone or feature implementation plan
  -> Small, testable tasks
  -> Implement, test, review, and demonstrate
  -> Release and operate
  -> Learn and update the specifications
```

This sequence is directional, not rigid. Implementation can reveal missing requirements or a bad assumption. When that happens, update the earlier artifact deliberately and trace the consequences. Do not silently make the code the new requirement.

## How to use this package

Read these files in order the first time:

1. `01-LIFECYCLE-AT-A-GLANCE.md`
2. `02-PROJECT-INITIATION.md`
3. `03-USER-JOURNEYS-AND-DISCOVERY.md`
4. `04-REQUIREMENTS.md`
5. `05-DECISIONS-AND-ARCHITECTURE.md`
6. `06-ROADMAP-PLANS-AND-TASKS.md`
7. `07-IMPLEMENTATION-LOOP.md`
8. `08-TEST-REVIEW-AND-RELEASE.md`
9. `09-PROJECT-MEMORY-AND-HANDOFFS.md`
10. `10-CHANGE-AND-MAINTENANCE.md`

Then keep these nearby:

- `SPECIALIZED-AGENT-ROLES.md` - how portable roles are selected, bounded, reviewed, and handed off
- `PROMPT-LIBRARY.md` - copy-ready prompts for each stage
- `CHECKLISTS.md` - concise review and stage-gate checklists
- `SAMPLE-SESSION-SEQUENCE.md` - a practical sequence of AI sessions
- `ILLUSTRATIVE-WALKTHROUGH.md` - a small fictional example from idea to task
- `11-COMMON-FAILURE-MODES.md` - warning signs and corrections
- `12-SCALING-THE-PROCESS.md` - when to simplify or add rigor
- `GLOSSARY.md` - plain definitions

## The normal human and AI division of work

| Work | AI is useful for | Human must own |
|---|---|---|
| Project definition | Drafting, structuring, finding ambiguities | Confirming the real problem, outcomes, scope, and constraints |
| User journeys | Expanding scenarios and edge cases | Confirming how real users and processes actually work |
| Requirements | Converting intent into testable statements | Approving business rules, priorities, and quality targets |
| Decisions | Comparing options and documenting tradeoffs | Choosing risk, cost, and strategic tradeoffs |
| Architecture | Drafting diagrams, flows, interfaces, and review questions | Approving consequential design and enterprise fit |
| Planning | Sequencing, dependency analysis, task decomposition | Setting priorities, capacity, and release commitments |
| Coding | Implementation, tests, refactoring, documentation | Reviewing high-risk changes and accepting results |
| Testing | Generating cases, running checks, analyzing failures | Deciding whether evidence is sufficient for release |
| Handoffs | Updating state and summarizing work | Confirming the summary reflects reality |

## The minimum viable version

For a small, low-risk project, begin with only:

- `PROJECT.md` or one combined `SPEC.md`
- A short requirements section with acceptance criteria
- Any necessary decision records
- One implementation plan
- `TASKS.md`
- Automated tests
- `HANDOFF.md`

The scaffold also includes `agents/`: portable role definitions for analysis, architecture, implementation, testing, security review, and documentation review. These Markdown files define responsibilities and boundaries; they do not automatically create separate processes. See `SPECIALIZED-AGENT-ROLES.md`.

Add separate security, operations, data, and API documents when the project actually needs them.

## What good looks like

A healthy project has these properties:

- A new session can understand the current state by reading the repository.
- Important claims are marked as known, assumed, or unknown.
- Requirements are observable and testable.
- Major choices have reasons and consequences recorded.
- Tasks are small enough to finish and review safely.
- Tests and automated checks produce evidence.
- The AI stops on high-impact ambiguity instead of guessing.
- Completed work updates both code and project memory.
- Humans review decisions, not every keystroke.

## A practical caution

Fluent output is not evidence. AI-generated statements about laws, products, APIs, security controls, performance, or external systems must be verified from authoritative sources before they become approved requirements or design inputs.
