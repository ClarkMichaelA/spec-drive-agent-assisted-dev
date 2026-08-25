# Runtime: Grok Build

This scaffold maps the portable delivery method onto Grok Build's native workflows and permission rules.

| Piece | File | Grok Build behavior |
| --- | --- | --- |
| Persistent project instructions | `AGENTS.md` | Loaded for every session in this tree |
| Role prompts | `agents/` | Read when a task needs that perspective |
| Delivery contract | `docs/WORK_PLAN.md` | Read by the work-plan workflow |
| Execute the plan | `.grok/workflows/work-plan.rhai` | `/work-plan` |
| Audit the repository | `.grok/workflows/spec-check.rhai` | `/spec-check` |
| Git and secret boundaries | `.grok/config.toml` | Deny and ask rules on top of the current permission mode |

## Use it

1. Fill in the real project facts and validation commands in `AGENTS.md`.
2. Approve exactly one implementation plan under `docs/plans/active/`.
3. Run `/work-plan`, or `/work-plan {"max_tasks":1}` when you want less unattended work. Grok Build may also select the workflow when a request clearly asks to execute an Approved plan.
4. Inspect the running product when the workflow stops at a phase checkpoint.

The workflow completes at most three tasks per invocation unless you set a lower `max_tasks`. It stops sooner for a completed phase, a blocker, or any stop condition in `docs/WORK_PLAN.md`. Then look at the running software and merge the phase, continue, or change the plan.

Run `/spec-check` when you pick the project up again, or before you believe a handoff. It is a fresh-context audit that must not edit the tree.

## Reviewers cannot edit

`work-plan` spawns a fresh child after every implementation task and a security child only for security-relevant work. Those children read the portable role files under `agents/` and run with `capability_mode: "execute"`: they can read and run commands, including the validation list in `AGENTS.md`, but they have no file-edit tools. Required findings return to the implementing agent.

This edition is validated before release: the test and security review jobs must use `capability_mode: "execute"`, not `"all"`.

Know what that does not cover. `execute` keeps the shell, and a shell can write files. This is a tool grant, not a sandbox. A reviewer that could not run a command must report that instead of claiming it passed.

Do not turn on Grok Build memory for durable project state. Durable state belongs in this repository, not in `~/.grok/memory/`.

## Permissions and Git

`.grok/config.toml` carries only denials and asks — the safety boundaries the project owns. It denies pushes to `main`, force pushes, and reads of environment and secret files, then asks before a push, merge, rebase, or amend. Model, reasoning effort, and personal approval preferences are deliberately absent; those belong to you or your organization.

Permission rules are a speed bump, not a proof: `git push origin HEAD:main` does not match the pattern that blocks `git push origin main`. Deny always wins over allow and over always-approve's normal pass-through.

The work-plan contract authorizes local task commits on `plan/<milestone>-<slug>`, but never a push, merge to `main`, history rewrite, deployment, or release. Those stay outside the workflow even if the current permission mode would allow them.

## Fit it to the project

- Replace every command placeholder in `AGENTS.md`; write `N/A` when a check does not exist.
- Copying into an existing project: merge `.grok/config.toml` into the file you already have. Do not overwrite it.
- Put the validation commands from `AGENTS.md` section 11 into `[permission].allow` so the delivery loop stops asking for them.
- Keep reviewer jobs on `capability_mode: "execute"`. Required findings go back to the implementing agent.
- Project hooks under `.grok/hooks/` can add a hard stop, but they run only after `/hooks-trust`. Do not treat an untrusted checkout's hooks as loaded.

If a workflow is unavailable, prompt Grok Build to read `AGENTS.md` and execute `docs/WORK_PLAN.md` directly.

Official references: [modes and commands](https://docs.x.ai/build/modes-and-commands), [skills](https://docs.x.ai/build/features/skills-plugins-marketplaces), [subagents](https://docs.x.ai/build/features/subagents), [project rules](https://docs.x.ai/build/features/project-rules), and [permissions](https://docs.x.ai/build/features/permissions).
