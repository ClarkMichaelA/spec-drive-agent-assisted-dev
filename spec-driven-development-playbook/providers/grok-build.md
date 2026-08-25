# Grok Build

The Grok edition renders the common scaffold with Grok Build's own mechanisms rather than prose asking the agent to behave.

| Capability | File |
| --- | --- |
| Persistent repository guidance | `AGENTS.md` |
| Role prompts | `agents/` |
| Execute the Approved plan | `.grok/workflows/work-plan.rhai` |
| Audit whether the repo still describes itself | `.grok/workflows/spec-check.rhai` |
| Git and secret boundaries | `.grok/config.toml` |
| Runtime-specific usage and safety | `RUNTIME.md` |

## Start

1. Fill in the real project facts and validation commands in `AGENTS.md`.
2. Approve one implementation plan under `docs/plans/active/`.
3. Run `/work-plan`, or `/work-plan {"max_tasks":1}` for a single task.
4. Inspect the running product when the workflow stops at a phase checkpoint.

Grok Build can also select the workflow when the request clearly asks it to execute or continue the Approved plan. The workflow `when_to_use` text deliberately excludes plan drafting, scope changes, and ad hoc work so those requests do not enter the delivery loop accidentally.

## Why the Grok edition is shaped this way

Grok Build loads `AGENTS.md` before work and discovers project workflows under `.grok/workflows/`. `/work-plan` is a workflow, not a skill: it enforces the task cap, delegates fresh-context reviews as child agents, and stops when the portable `docs/WORK_PLAN.md` contract requires it.

Reviewers are not a second copy of `agents/`. The workflow points each child at the portable role file and spawns it with `capability_mode: "execute"`, which is the Grok-native write restriction. They inspect and report; the implementing agent fixes required findings. Both keep a shell so they can run the project's validation commands, so this is a tool grant rather than a sandbox. A reviewer that could not run a command must report that limitation instead of claiming success.

`/spec-check` is a separate workflow. It audits handoff, task statuses, placeholders, and untested Musts in a fresh context and must not edit the tree.

`.grok/config.toml` carries only denials and asks — the safety boundaries the project owns. Model, reasoning effort, and personal approval preferences are deliberately absent; those belong to you or your organization.

Read the rendered `RUNTIME.md` before use. It is authoritative for invocation, reviewer isolation, permissions, Git boundaries, and the direct-contract fallback.

Official references: [modes and commands](https://docs.x.ai/build/modes-and-commands), [skills](https://docs.x.ai/build/features/skills-plugins-marketplaces), [subagents](https://docs.x.ai/build/features/subagents), and [permissions](https://docs.x.ai/build/features/permissions).
