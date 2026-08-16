# 1. Lifecycle at a Glance

## One page

| Stage | Question | Artifact | You |
| --- | --- | --- | --- |
| 1. Initiation | What problem, for whom, why? | `PROJECT.md` | Approve problem, outcome, scope, non-goals |
| 2. Discovery | How do people actually get there? | `user_journeys/` | Confirm it matches reality |
| 3. Requirements | What must be true? | `REQUIREMENTS.md` | Approve testable rules. Delete the rest. |
| 4. Decisions | What is expensive to reverse? | `docs/decisions/` | Choose. Skip cheap choices. |
| 5. Architecture | How does that force the system to look? | `ARCHITECTURE.md` | Approve trust boundaries and the shape |
| 6. Roadmap | Which outcome first? | `ROADMAP.md` | Approve milestones and exclusions |
| 7. Plan | How will this milestone be built and proven? | Active plan | **This is the delivery gate.** Phases, tasks, review policy, stops. |
| 8. Delivery | Does the next task meet its criteria? | Code, tests, plan branch | You do not Ready tasks. Grok runs until a phase or a stop. |
| 9. Phase | Can I see the outcome of this slice? | Running software + PR | Look at the product. Merge, continue, or change the plan. |
| 10. Release | Is the milestone safe to give someone? | Evidence + changelog | Accept the risk |
| 11. Learn | What did reality do? | Change to the spec | New priorities |

There is no "approve this ticket" stage. That was process. It did not buy safety.

## Not a waterfall

Journeys find missing scope. Requirements find missing decisions. Implementation kills assumptions. Tests find vague criteria. Production finds the real requirement.

Update the file. Trace the blast. Continue. Do not quietly make the code the spec.

## Three modes

**Discover** — understand. Brief, journeys, assumptions, maybe a spike. Challenge guesses.

**Plan** — turn approved intent into one executable plan. Dependencies, failure, security, tests, rollback. Human approves the plan.

**Deliver** — Grok takes the next task on that plan, proves it, commits, repeats. Stops at a phase or when the plan is wrong. Does not redesign the project under the guise of a task.

## Where your eyes go

1. Is this the real problem and a small enough first outcome?
2. Are the Must rules real, testable, and not secretly design?
3. Are outside facts verified?
4. Are security, data, and failure acceptable?
5. Are the expensive choices justified?
6. Is the **plan** a walking path you could defend — phases you can see, tasks that are small, stops that are real?
7. After a phase: does the software do the thing?

You do not need to edit every sentence. You do not need to Ready T-014.

## Rhythm

Planning:

```text
Grok drafts -> Grok attacks its own draft -> you review -> Grok revises -> you approve
```

Delivery:

```text
You approve the plan
    -> Grok: next task -> tests -> only the reviews that pay -> commit
    -> repeat until phase checkpoint or stop
    -> you use the software
    -> merge to v1, continue, or change the plan
```

## Four words

- **Intent** — the outcome
- **Evidence** — what proves a claim
- **Boundaries** — what Grok may not decide
- **State** — what the repo says is true
