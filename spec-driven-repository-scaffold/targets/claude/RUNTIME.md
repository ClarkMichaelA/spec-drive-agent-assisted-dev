# Runtime: Claude Code

This scaffold wires the portable method into Claude Code's own mechanisms.

| Piece | File | Invocation |
| --- | --- | --- |
| Persistent instructions | `CLAUDE.md`, which imports `AGENTS.md` | Every session |
| Delivery contract | `docs/WORK_PLAN.md` | Read by the skill |
| Execute the plan | `.claude/skills/work-plan/SKILL.md` | `/work-plan` |
| Audit the repository | `.claude/skills/spec-check/SKILL.md` | `/spec-check` |
| Roles as subagents | `.claude/agents/` | Delegated, or `@name` |
| Rules for one area | `.claude/rules/` | Loaded when a matching file is read |
| Permissions | `.claude/settings.json` | Enforced by the client |

## Use it

1. Fill in the real project facts and validation commands in `AGENTS.md`.
2. Approve exactly one implementation plan under `docs/plans/active/`.
3. Start Claude Code in the project and trust the folder, so project settings, skills, and hooks apply.
4. Run `/work-plan`, or `/work-plan 1` when you want less unattended work. Claude Code may also select the skill on its own when a request clearly asks it to execute an Approved plan.
5. Inspect the running product when Claude Code stops at a phase checkpoint.

The skill stops at a phase checkpoint, a blocker, or the task cap. Then look at the running software and merge the phase, continue, or change the plan.

Run `/spec-check` when you pick the project up again, or before you believe a handoff. It is read-only.

## Reviewers cannot edit

`.claude/agents/test-engineer.md` and `.claude/agents/security-reviewer.md` list no write tools, so a required finding must come back to the implementer instead of being quietly fixed by the reviewer that found it. This edition is validated before release: both files must declare an explicit `tools:` list granting no `Edit`, `Write`, `MultiEdit`, or `NotebookEdit`. If you edit them, keep that property.

Know what that does not cover. Both reviewers keep `Bash` so they can run the validation commands in `AGENTS.md`, and a shell can write files. This is a tool grant, not a sandbox. A reviewer that could not run a command must report that instead of claiming it passed.

Each subagent reads its role file under `agents/` first. Those role files stay authoritative; the files in `.claude/agents/` only add runtime mechanics.

Do not enable the subagent `memory:` field. Durable state belongs in this repository, not in a per-agent store outside it.

## Read this before you trust the scaffold

`work-plan` pre-approves `git add` and `git commit` for the turn that invokes it. Read its `allowed-tools` line. A project skill's grants apply even in a folder you have never trusted, so review the `allowed-tools` of any skill in any repository you clone before you run Claude Code there.

`.claude/settings.json` denies pushes to `main`, force pushes, and reads of environment and secret files, then asks before a push, merge, rebase, or amend. Permission rules are a speed bump, not a proof: `git push origin HEAD:main` does not match the pattern that blocks `git push origin main`.

For a hard stop, add a `PreToolUse` hook. A prompt hook needs no script and no shell, so it behaves the same on every platform:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash|PowerShell",
        "hooks": [
          {
            "type": "prompt",
            "if": "Bash(git *)",
            "prompt": "Deny this call if it pushes to main, merges into main, or rewrites history on a shared branch. Otherwise allow it. Input: $ARGUMENTS",
            "timeout": 30
          }
        ]
      }
    ]
  }
}
```

Hooks in project settings run only after you trust the folder.

## Fit it to your project

- Put the validation commands from `AGENTS.md` section 11 into `permissions.allow` so the delivery loop stops asking for them.
- Copying into an existing project: merge `.claude/settings.json` into the file you already have. Do not overwrite it.
- `.claude/settings.local.json` is personal and stays out of git via `.claude/.gitignore`.
- Both skills inject live git state with `` !`command` `` at invocation. Those commands run in bash and in PowerShell, but `shell: bash` is the default and fails on Windows without Git Bash — set `shell: powershell` in the skill frontmatter there.

If a skill is unavailable, prompt Claude Code to read `AGENTS.md` and execute `docs/WORK_PLAN.md` directly.

Official references: [memory](https://code.claude.com/docs/en/memory), [skills](https://code.claude.com/docs/en/skills), [subagents](https://code.claude.com/docs/en/sub-agents), [hooks](https://code.claude.com/docs/en/hooks), and [permissions](https://code.claude.com/docs/en/permissions).
