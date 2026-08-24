@AGENTS.md

# Claude Code

`AGENTS.md` above is the working agreement and wins every conflict. This section is only how that agreement is wired into this runtime.

## Entry points

| Command | Does |
| --- | --- |
| `/work-plan` | Execute the Approved plan to the next phase checkpoint, blocker, or task cap |
| `/spec-check` | Read-only: does the repository still describe itself honestly |

## Roles

The role files under `agents/` are authoritative. `.claude/agents/` holds one subagent per role that reads its role file first. Reviewers there have no write tools, so a required finding must come back to the implementer instead of being quietly fixed by its reviewer.

Delegate a review to a fresh subagent. Reviewing your own diff in this context is a self-review — say so.

## This session

- Verify `HANDOFF.md` and `TASKS.md` against git before trusting either.
- Editing an Approved plan, decision record, or requirement is a human decision. Stop and propose.
- Commit per task on the plan branch. Never merge to `main`.
- Durable state is a file in this repository. Not memory, not this conversation.
