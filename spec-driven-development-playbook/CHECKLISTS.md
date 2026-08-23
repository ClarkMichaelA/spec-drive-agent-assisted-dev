# Checklists

Use these at gates. Do not invent more gates.

## Brief

- [ ] Problem stated without a product
- [ ] Users named
- [ ] Outcome you could notice
- [ ] In and out of scope
- [ ] Constraints have a source, or they are guesses
- [ ] Unknowns still unknown
- [ ] You approve it

## Journeys

- [ ] Main path a real person recognizes
- [ ] Failure and recovery exist
- [ ] Permissions and data are not hand-waved
- [ ] Unverified process is marked

## Requirements

- [ ] Each Must is necessary
- [ ] You can tell if it failed
- [ ] One idea each
- [ ] Ugly cases (auth, failure, data) exist if the system has them
- [ ] No disguised architecture
- [ ] TBDs are TBD

If you cannot falsify it, delete it.

## Decision

- [ ] Reversing this would actually hurt
- [ ] Real alternatives
- [ ] Facts vs guesses
- [ ] You chose

If reversal is cheap, do not write an ADR.

## Architecture

- [ ] Each part has one job
- [ ] Trust boundary is drawn
- [ ] Failure is described
- [ ] Complexity traces to a Must
- [ ] External facts checked

## Plan (this is the delivery gate)

- [ ] Outcome matches the milestone
- [ ] In / out is sharp
- [ ] 2–4 phases, each something you can run or see
- [ ] Tasks are small and ordered
- [ ] Acceptance criteria are observable
- [ ] Review policy is specific (not "all roles")
- [ ] Stop conditions are written
- [ ] No open expensive question
- [ ] You approve **the plan**, not the tickets

## Phase checkpoint

- [ ] You ran or used the slice
- [ ] Phase validation commands ran
- [ ] Remaining falsehoods are visible
- [ ] Next move is continue, merge to `main`, or change the plan

## Task (agent checks this, not you)

- [ ] One outcome
- [ ] Linked to the plan and a requirement
- [ ] Dependencies done
- [ ] Criteria you can observe
- [ ] Validation command exists
- [ ] Not a hidden decision

Done on the plan branch:

- [ ] Criteria true
- [ ] Required commands ran and passed
- [ ] Needed reviews finished or waived
- [ ] Specs that went false were updated
- [ ] `TASKS.md` / `HANDOFF.md` match git

## Release

- [ ] Milestone exit is true
- [ ] Musts have evidence
- [ ] You know the SHA
- [ ] Limits accepted
- [ ] You accept the risk

## Session start

- [ ] Read `AGENTS.md` and the approved plan
- [ ] Verify branch, SHA, dirty tree
- [ ] Distrust `HANDOFF.md` until checked
- [ ] Next action is a task, a phase look, or a stop — not "pick something"

## Session end

- [ ] Commands ran
- [ ] State files match reality
- [ ] Next action is one sentence
