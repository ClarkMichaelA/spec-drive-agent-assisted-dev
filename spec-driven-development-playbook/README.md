# Playbook

How to take an idea to something you can run, using Grok Build, without turning chat into the project.

Written for one person. Grok does the labor. You decide what "good" is.

Specs are files. Any assistant can read them. The delivery loop is built for Grok.

## The split

Grok: draft, organize, implement, test, review a diff, update state.

You:

- The real problem
- Scope and non-goals
- Facts about the outside world
- Irreversible choices
- The plan (not the tickets)
- Whether the running software is right
- Release

The repository is memory. If it is not in a file or a test, it did not happen.

## The sequence

```text
Idea
  -> PROJECT.md
  -> journeys
  -> requirements
  -> decisions you cannot cheaply undo
  -> architecture those decisions force
  -> roadmap of outcomes
  -> one plan, with phases
  -> Grok executes the plan
  -> you inspect each phase
  -> release
  -> change the spec when reality disagrees
```

Directional, not sacred. When code disproves a spec, update the spec. Do not pretend the code was what you meant.

## Read this first

1. `01-LIFECYCLE-AT-A-GLANCE.md`
2. `02-PROJECT-INITIATION.md`
3. `03-USER-JOURNEYS-AND-DISCOVERY.md`
4. `04-REQUIREMENTS.md`
5. `05-DECISIONS-AND-ARCHITECTURE.md`
6. `06-ROADMAP-PLANS-AND-TASKS.md`
7. `07-IMPLEMENTATION-LOOP.md` — the part that actually changed
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

Roles live in the scaffold: `agents/`. The playbook does not need a second catalog.

## Minimum

- `PROJECT.md` or one `SPEC.md`
- Requirements you can test
- ADRs only if reversal is expensive
- One plan
- Tests
- `HANDOFF.md`

If you are maintaining more files than you have users, delete files.

## Good looks like

- A new Grok session can start from the repo
- Claims are known, assumed, or unknown — never "sounds right"
- Requirements can fail a test
- Hard choices have a reason
- You approved a plan, not a pile of tickets
- Grok stops when the plan is wrong
- Checks that matter are commands, not slogans
- You look at the product at each phase

## Caution

Fluent is free. True is not. Verify laws, APIs, prices, and security claims at the source before they become Approved.
