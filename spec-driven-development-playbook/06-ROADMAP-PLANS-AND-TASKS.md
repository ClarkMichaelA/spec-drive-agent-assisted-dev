# 6. Roadmap, Plans, and Tasks

Three levels. Do not collapse them.

- **Roadmap:** which outcome first?
- **Plan:** how will *this* outcome be built and proven?
- **Tasks:** the fuel the coding agent burns. Not a place you live.

A long task list with no plan is how hidden decisions and giant tickets get born.

## Roadmap: outcomes

Good:

```text
A pilot user can complete the primary journey in a test environment,
and we can see why it failed when it fails.
```

Bad:

```text
Build the database, then the API, then the UI.
```

First milestone is almost always a walking skeleton: build, run, talk to one dependency, store one fact, test it.

Each milestone: outcome, requirements in, exclusions, dependencies, risk it kills, exit evidence. No fake dates.

## Plan: the thing you approve

Write a plan when the work spans parts, touches data, changes an interface, or can land wrong.

The plan is the control surface. After you approve it, the coding agent does not ask you to Ready each task.

A plan that earns approval has:

- Outcome and a hard in/out
- Current state (as it is, not as you wish)
- Target behavior tied to approved requirements
- Data, interface, security effects
- **2–4 phases**, each with something you can see or run
- Which extra reviews apply, and when (not "all reviews, always")
- Tests that would prove the outcome
- Deploy / migrate / rollback only if those are real
- Open questions that would stop work — none remaining, or you are not approving
- Task breakdown with acceptance criteria
- Stop conditions

If a high-impact choice is still open, do not approve the plan. Do not hide it in T-003.

### Phases are your steering wheel

A phase is a slice you can look at. Not a component layer unless the architecture forces it.

Example:

1. Walking path builds and a test user can read one record
2. The core rule is enforced, including the failure case
3. A person can do it through the UI
4. You can tell when it breaks

After each phase, the coding agent stops. You use the software. Then continue, merge, or change the plan.

That is "managing the plan."

## Tasks: small enough to prove

A task is one outcome, linked to requirements and the plan, with a test you can run.

The coding agent writes them from the approved plan into `TASKS.md` and keeps the statuses honest. You do not groom the queue.

**Ready** means: the plan authorized it, dependencies are done, criteria are testable, nothing expensive is still a question. The agent checks this before it starts a task. You already approved the plan.

**Done** means: criteria met on the plan branch, required checks ran, needed reviews finished or you waived them. Done is not "merged to `main`." Merge is a phase event.

Prefer a vertical slice over "all the schema, then all the services, then all the buttons."

## Delete these

- An issue per task
- A Project board that copies `TASKS.md`
- You clicking Ready
- A branch per task (you are one person, one plan branch)
- A reviewer role on a task that does not touch that concern

## Prompts

### Roadmap

```text
Read the approved brief, requirements, architecture, risks, and ROADMAP.md.

Write an outcome roadmap. First milestone is a walking skeleton.

For each milestone: outcome, users, requirements in, exclusions,
dependencies, risk reduced, exit evidence.

No dates unless I gave them. No component shopping list.
```

### Plan

```text
Read approved requirements, decisions, architecture, milestone [M-00],
risks, and the plan template.

Draft one implementation plan. Include current state, target behavior,
in/out, affected parts, data and interface changes, security, 2-4 phases
with something I can see after each, test approach, rollback if relevant,
risks, stop conditions, review policy (which reviews, when), and a
task breakdown with acceptance criteria.

Do not invent tasks that hide an open architecture choice. List blockers
first. If blockers exist, stop. Do not ask me to Ready each task later.
```

### Critique the plan

```text
Review the draft plan without implementing it.

Find: phases I cannot actually inspect, tasks that are secret projects,
missing failure/security/data behavior, reviews that are theater,
missing stop conditions, and decisions smuggled into tasks.

Return a tighter phase list and a corrected task order.
```

## Exit

Start delivery when:

- The milestone has an outcome and exit evidence
- One plan is **Approved**
- Tasks in that plan are small and ordered
- Validation commands exist or the first task creates them
- Expensive questions are closed
