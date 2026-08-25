# Runtime: Codex

This scaffold maps the portable delivery method onto Codex's native project instructions, repository skills, and subagents.

| Piece | File | Codex behavior |
| --- | --- | --- |
| Persistent project instructions | `AGENTS.md` | Loaded before work begins |
| Delivery contract | `docs/WORK_PLAN.md` | Read by the work-plan skill |
| Execute the plan | `.agents/skills/work-plan/SKILL.md` | Selected from Skills or invoked as `$work-plan` |
| Skill UI metadata | `.agents/skills/work-plan/agents/openai.yaml` | Labels and seeds the skill in the desktop app |
| Independent test review | `.codex/agents/test_engineer.toml` | Fresh, read-only subagent |
| Conditional security review | `.codex/agents/security_reviewer.toml` | Fresh, read-only subagent |

## Use it

1. Fill in the real project facts and validation commands in `AGENTS.md`.
2. Approve exactly one implementation plan under `docs/plans/active/`.
3. In the desktop app, select **Work plan** from Skills. In the CLI or IDE extension, mention `$work-plan`. Codex may also select it automatically when your request clearly asks to execute or continue the Approved plan.
4. Choose a permission mode that permits the planned repository writes and local commits.
5. Inspect the running product when Codex stops at a phase checkpoint.

The skill completes at most three tasks per invocation unless you set a lower limit in your request. It stops sooner for a completed phase, a blocker, or any stop condition in `docs/WORK_PLAN.md`.

## Native review isolation

The work-plan skill explicitly asks Codex to spawn `test_engineer` after each implementation task and `security_reviewer` only for security-relevant work. Both custom agents use a read-only sandbox and return findings to the implementing agent. This preserves fresh context without allowing a reviewer to quietly edit the code it reviewed.

Subagents inherit the parent turn's live permission mode. A reviewer may be unable to rerun a command that writes build artifacts or caches; it must report that limitation rather than claim the command passed.

## Permissions and Git

Codex applies the permission mode selected for the current turn; this scaffold does not weaken it or check in a personal `config.toml`. The work-plan contract authorizes local task commits on `plan/<milestone>-<slug>`, but never a push, merge to `main`, history rewrite, deployment, or release. If Codex cannot obtain a required approval, it stops and reports the blocked action.

## Fit it to the project

- Keep `AGENTS.md` concise because Codex loads it into every task. Put detailed process in the owning specification or skill.
- Replace every command placeholder in `AGENTS.md`; write `N/A` when a check does not exist.
- Add nested `AGENTS.md` or `AGENTS.override.md` only when a subtree genuinely needs different instructions.
- Keep the reviewer agents read-only. Required findings go back to the implementing agent.

If the repository skill is unavailable, ask Codex to read `AGENTS.md` and execute `docs/WORK_PLAN.md` directly.

Official references: [AGENTS.md](https://learn.chatgpt.com/docs/agent-configuration/agents-md), [skills](https://learn.chatgpt.com/docs/build-skills), and [subagents](https://learn.chatgpt.com/docs/agent-configuration/subagents).
