# Roles

These files are perspectives. They do not start processes, isolate worktrees, or create a second human.

`AGENTS.md` always wins. `/work-plan` picks the role. You can also name one in a prompt.

## Catalog

| Role | When |
| --- | --- |
| [Project Analyst](project-analyst.md) | Brief, journeys, requirements. Before there is a plan. |
| [Solution Architect](solution-architect.md) | ADRs, architecture, **the plan**. Stops when an expensive choice is still open. |
| [Software Engineer](software-engineer.md) | Next authorized task on an Approved plan. |
| [Test Engineer](test-engineer.md) | Fresh context after implement. Also: missing tests, regressions. |
| [Security Reviewer](security-reviewer.md) | Design-time threat pass, and task diffs the plan marked. |
| [Documentation Reviewer](documentation-reviewer.md) | A spec is now false, or a phase/release look. Not every task. |

No UI/UX role. If a user can see it, the engineer or test review **uses** it.

Do not add a role to change tone. Use `ROLE-TEMPLATE.md` only for a responsibility that is actually different.

## In the loop

```text
You approve the plan (Architect drafted it)
    -> Engineer implements the next task
    -> Test Engineer, fresh context
    -> Security Reviewer only if the plan marked the task
    -> Engineer fixes required findings
    -> commit on the plan branch
    -> next task or phase checkpoint
```

Same chat, new filename, is a self-review.

## Handoffs

Roles talk through the plan, `TASKS.md`, `HANDOFF.md`, ADRs, tests, and git. Not through chat.
