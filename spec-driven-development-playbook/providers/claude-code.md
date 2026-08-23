# Claude Code

The Claude Code edition renders the common scaffold with `CLAUDE.md`, `.claude/skills/work-plan/SKILL.md`, and a Claude-specific `RUNTIME.md`.

1. Fill in the real project and validation commands in `AGENTS.md`.
2. Approve one implementation plan.
3. Run `/work-plan`.
4. Inspect the running product when Claude Code stops at a phase.

`CLAUDE.md` imports the shared `AGENTS.md`; the skill loads the portable delivery contract only when the workflow is invoked.

References: [Claude Code project memory](https://code.claude.com/docs/en/memory) and [Claude Code skills](https://code.claude.com/docs/en/skills).
