# Claude Code

The Claude Code edition renders the common scaffold with an adapter built from this runtime's own mechanisms rather than prose asking the agent to behave.

| Piece | Purpose |
| --- | --- |
| `CLAUDE.md` | Imports the shared `AGENTS.md`, then adds only Claude-specific wiring |
| `.claude/skills/work-plan/` | `/work-plan` — executes the Approved plan against `docs/WORK_PLAN.md` |
| `.claude/skills/spec-check/` | `/spec-check` — read-only audit of handoff, task statuses, placeholders, untested Musts |
| `.claude/agents/` | One subagent per role file in `agents/` |
| `.claude/rules/` | Rules that load only when a file they govern is read |
| `.claude/settings.json` | Denies pushes to `main`, force pushes, and secret reads; asks before a merge |

1. Fill in the real project facts and validation commands in `AGENTS.md`.
2. Approve one implementation plan.
3. Run `/work-plan`, or `/work-plan 1` for a single task.
4. Inspect the running product when Claude Code stops at a phase.

Two properties are worth knowing before you use it.

**Reviewers cannot edit.** The test and security subagents list no write tools, so a required finding goes back to the implementer instead of being quietly fixed by whoever found it. The build refuses to publish this edition if either one gains a write tool or drops its `tools:` list. Both keep `Bash` so they can run the project's validation commands, so this is a tool grant rather than a sandbox. The role files under `agents/` stay authoritative; the subagent files only add runtime mechanics.

**The plan skill pre-approves commits.** `work-plan` grants itself `git add` and `git commit` for the turn that invokes it, because the contract commits once per task. Read that `allowed-tools` line before running this — or any checked-in skill — in a repository you did not write.

The edition deliberately stops there. `.claude/settings.json` carries only denials and asks — the safety boundaries the project owns. Model, reasoning effort, and personal approval preferences are deliberately absent; those belong to you or your organization.

The scaffold's `RUNTIME.md` is authoritative for the installed edition, including how to add a hard stop with a hook and what to do on Windows without Git Bash.

References: [memory](https://code.claude.com/docs/en/memory), [skills](https://code.claude.com/docs/en/skills), [subagents](https://code.claude.com/docs/en/sub-agents), and [permissions](https://code.claude.com/docs/en/permissions).
