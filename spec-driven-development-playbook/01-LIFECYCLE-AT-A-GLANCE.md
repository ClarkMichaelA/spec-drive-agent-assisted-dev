# 1. Lifecycle at a Glance

## The process in one page

| Stage                 | Main question                                                           | Primary artifact                     | Human gate                                                 |
| --------------------- | ----------------------------------------------------------------------- | ------------------------------------ | ---------------------------------------------------------- |
| 1. Initiation         | What problem are we solving, for whom, and why?                         | `PROJECT.md`                         | Approve problem, outcomes, scope, and constraints          |
| 2. Discovery          | How do users and systems actually reach the outcome?                    | `user_journeys/`                     | Confirm journeys reflect reality                           |
| 3. Requirements       | What must be true, including quality and failure behavior?              | `REQUIREMENTS.md`                    | Approve testable requirements and priorities               |
| 4. Decisions          | Which consequential choices must be made, and why?                      | Decision records                     | Approve difficult-to-reverse choices                       |
| 5. Architecture       | How will the accepted system work as a whole?                           | `ARCHITECTURE.md`                    | Approve design, trust boundaries, and operational approach |
| 6. Roadmap            | In what outcome-based order will value and risk reduction be delivered? | `ROADMAP.md`                         | Approve milestones and exclusions                          |
| 7. Planning           | How will one active milestone or feature be built and verified?         | Active implementation plan           | Approve sequence, migration, testing, and rollback         |
| 8. Tasks              | What are the smallest safe units of executable work?                    | `TASKS.md`                           | Confirm tasks are Ready                                    |
| 9. Delivery           | Does each task meet its acceptance criteria and checks?                 | Code, tests, task evidence           | Review risk-appropriate changes                            |
| 10. Release           | Is the complete outcome safe, supportable, and demonstrable?            | Release review and changelog         | Accept release risk                                        |
| 11. Operate and learn | What happened in real use, and what should change?                      | Metrics, incidents, change proposals | Approve new priorities and changes                         |

## This is not a one-way waterfall

The order prevents premature coding, but feedback is expected:

- A user journey may reveal missing scope.
- A requirement may expose an unresolved business decision.
- Architecture work may reveal that a quality target is unrealistic.
- Implementation may disprove an assumption.
- Testing may reveal that an acceptance criterion is ambiguous.
- Production use may create a new requirement.

The correct response is to update the affected artifact, review the impact, and continue. The wrong response is to quietly change code and leave the specifications false.

## The three working modes

### Discovery mode

Purpose: understand the problem and reduce uncertainty.

Typical outputs:

- Project brief
- User journeys
- Assumptions and questions
- Early requirements
- Short technical experiments or research notes

The AI should challenge gaps and separate evidence from guesses.

### Planning mode

Purpose: turn approved intent into an executable approach.

Typical outputs:

- Requirements
- Decision records
- Architecture
- Roadmap
- Implementation plan
- Ready tasks

The AI should analyze dependencies, failure modes, security, testing, operations, and rollback.

### Delivery mode

Purpose: complete one bounded unit of work and produce evidence.

Typical outputs:

- Code and configuration
- Tests
- Validation results
- Documentation updates
- Task status
- Handoff state

The AI should not redesign the project while pretending to complete a task.

## Review at the highest-leverage points

You do not need to manually edit every sentence. Concentrate your attention on:

1. Whether the problem and scope are correct
2. Whether requirements reflect the real business rules
3. Whether important external facts are verified
4. Whether security, data, and failure behavior are acceptable
5. Whether architecture decisions are justified
6. Whether tasks have clear acceptance criteria
7. Whether test evidence supports completion and release

## A useful operating rhythm

For early planning:

```text
AI drafts -> AI critiques -> human reviews -> AI revises -> human approves
```

For implementation:

```text
Select one Ready task -> plan -> implement -> test -> self-review
-> independent review when warranted -> fix -> update state -> stop
```

## Four words to remember

- **Intent:** what outcome is wanted
- **Evidence:** what proves a claim
- **Boundaries:** what the AI may and may not change
- **State:** what the repository says is currently true
