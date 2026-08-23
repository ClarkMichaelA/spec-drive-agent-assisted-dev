# Implementation Plans

The plan is the control surface. You approve it. The coding agent executes it. You come back at a phase.

One active plan per workstream. Two plans for the same work means nobody is in charge.

## Lifecycle

1. Draft from approved requirements, ADRs, architecture, and the milestone.
2. Attack it: phases you cannot see, tasks that are projects, open expensive questions.
3. You approve. That authorizes the task queue. You do not Ready tickets later.
4. The coding agent works on `plan/<milestone>-<slug>` until a phase checkpoint or a stop.
5. You use the software. Merge the phase to `main`, continue, or change the plan.
6. When the plan's exit is true, move the file to `completed/`.

Material scope or design changes go through `CHANGE_CONTROL.md`. The loop does not get to edit a Must to stay green.
