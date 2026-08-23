# Runtime: Claude Code

This scaffold uses Claude Code project instructions and a project skill.

- Persistent project instructions: `CLAUDE.md`, which imports `AGENTS.md`
- Delivery contract: `docs/WORK_PLAN.md`
- Skill: `.claude/skills/work-plan/SKILL.md`
- Invocation: `/work-plan`

Approve an implementation plan, then run `/work-plan`. Claude Code may also select the skill automatically when the request clearly asks it to execute an Approved plan.

Official references: [Claude Code memory](https://code.claude.com/docs/en/memory) and [Claude Code skills](https://code.claude.com/docs/en/skills).
