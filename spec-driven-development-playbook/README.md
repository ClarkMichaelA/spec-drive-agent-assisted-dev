# Playbook

How to take an idea to something you can run with a coding agent, without turning chat into the project.

Written for one person. The agent does the repeatable labor. You decide what “good” means.

The method is runtime-neutral. Runtime guides explain how Grok Build, Codex, Claude Code, and Hermes Agent load the scaffold and invoke the delivery loop.

## The split

The coding agent drafts, organizes, implements, tests, reviews a diff in fresh context when needed, and updates repository state.

You own:

- The real problem
- Scope and non-goals
- Facts about the outside world
- Irreversible choices
- The plan, not individual ticket readiness
- Whether the running software is right
- Release

The repository is memory. If it is not in a file or a test, it did not happen.

## The sequence

```text
Idea
  -> PROJECT.md
  -> journeys
  -> requirements
  -> decisions expensive to reverse
  -> architecture those decisions force
  -> roadmap of outcomes
  -> one plan with phases
  -> the agent executes the plan
  -> you inspect each phase
  -> release
  -> change the specification when reality disagrees
```

Directional, not sacred. When code disproves a specification, update the specification deliberately.

## Read this first

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

Keep nearby:

- `PROMPT-LIBRARY.md`
- `CHECKLISTS.md`
- `ILLUSTRATIVE-WALKTHROUGH.md`
- `11-COMMON-FAILURE-MODES.md`
- `12-SCALING-THE-PROCESS.md`
- `GLOSSARY.md`

Roles live in the scaffold under `agents/`. The portable execution contract is `docs/WORK_PLAN.md` in the rendered scaffold.

## Choose a runtime

- [Grok Build](providers/grok-build.md)
- [Codex](providers/codex.md)
- [Claude Code](providers/claude-code.md)
- [Hermes Agent](providers/hermes-agent.md)

Download one matching release archive. Do not combine target adapters.

## Minimum

- `PROJECT.md` or one `SPEC.md`
- Requirements that can fail a test
- Decision records only when reversal is expensive
- One plan
- Tests
- `HANDOFF.md`

If you are maintaining more files than the project needs, delete files.

## Good looks like

- A new agent session can reconstruct the project from the repository
- Claims are known, assumed, or unknown—never merely plausible
- Requirements can fail a test
- Hard choices have a reason
- You approved a plan, not a pile of tickets
- The agent stops when the plan is wrong
- Checks that matter are commands, not slogans
- You inspect the running product at each phase

## Caution

Fluent is free. True is not. Verify laws, APIs, prices, and security claims at primary sources before they become Approved.
