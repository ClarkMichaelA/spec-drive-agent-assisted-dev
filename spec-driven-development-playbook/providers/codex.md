# Codex

The Codex edition renders the common scaffold with Codex-native project instructions, a repository skill, desktop metadata, and two project-scoped reviewer agents.

| Capability | File |
| --- | --- |
| Persistent repository guidance | `AGENTS.md` |
| Execute the Approved plan | `.agents/skills/work-plan/SKILL.md` |
| Desktop skill presentation | `.agents/skills/work-plan/agents/openai.yaml` |
| Independent test review | `.codex/agents/test_engineer.toml` |
| Conditional security review | `.codex/agents/security_reviewer.toml` |
| Runtime-specific usage and safety | `RUNTIME.md` |

## Start

1. Fill in the real project facts and validation commands in `AGENTS.md`.
2. Approve one implementation plan under `docs/plans/active/`.
3. Select **Work plan** from Skills in the desktop app, or mention `$work-plan` in the CLI or IDE extension.
4. Inspect the running product when Codex stops at a phase checkpoint.

Codex can also select the skill implicitly when the request clearly asks it to execute or continue the Approved plan. The skill description deliberately excludes plan drafting, scope changes, and ad hoc work so those requests do not enter the delivery loop accidentally.

## Why the Codex edition is shaped this way

Codex loads `AGENTS.md` before work and discovers repository skills under `.agents/skills/`. The work-plan skill stays focused on one job and delegates fresh-context reviews to project-scoped agents under `.codex/agents/`.

The reviewer agents use `sandbox_mode = "read-only"`. They inspect and report; the implementing agent fixes required findings. They inherit the parent turn's live permissions, so a test command that writes caches or build output may not run in the reviewer sandbox. A reviewer must report that limitation instead of claiming success.

No project `config.toml` is included. Models, reasoning effort, concurrency, and personal approval preferences belong to the user or organization unless the project has a verified reason to pin them. The scaffold specifies only the isolation required by its review contract.

Read the rendered `RUNTIME.md` before use. It is authoritative for invocation, permissions, Git boundaries, and the direct-contract fallback.

Official references: [AGENTS.md](https://learn.chatgpt.com/docs/agent-configuration/agents-md), [skills](https://learn.chatgpt.com/docs/build-skills), and [subagents](https://learn.chatgpt.com/docs/agent-configuration/subagents).
