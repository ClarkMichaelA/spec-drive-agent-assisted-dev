---
name: spec-check
description: Read-only audit of whether the repository still describes itself honestly - handoff against git, task statuses against the Approved plan, unreplaced template placeholders, and requirements no test covers.
when_to_use: Before trusting a handoff, when picking a project up after time away, at a phase checkpoint, or when the human asks whether the specifications still match the code.
context: fork
agent: Explore
background: false
allowed-tools: >
  Read Grep Glob
  Bash(git status:*) Bash(git log:*) Bash(git diff:*) Bash(git branch:*)
---

# Spec check

Audit this repository and report. Change nothing: no edits, no commits, no new files.

## Read

`AGENTS.md`, `RUNTIME.md`, `docs/INDEX.md`, `HANDOFF.md`, `TASKS.md`, the plans under `docs/plans/active/`, and `docs/REQUIREMENTS.md`. Use git for the real state.

## Check

1. **Handoff against git** — do the branch, SHA, and "just proven" claim in `HANDOFF.md` match what git shows? Name the drift.
2. **Tasks against the plan** — is every Ready or Done task in `TASKS.md` authorized by an Approved plan? Is any plan task missing from the queue? Does a Done task have the tests and evidence it claims?
3. **Placeholders** — bracketed template text still unreplaced in files the project actually uses. Ignore the template files themselves.
4. **Untested Musts** — requirements marked Must with no test that would fail if the behavior were deleted. Name the requirement id and where you looked.
5. **Orphans** — documents that answer no question the project has, and links pointing at files that do not exist.
6. **Commands** — does `AGENTS.md` list commands that exist and run, or fake ones nobody replaced?
7. **Secrets** — anything credential-shaped committed to the tree.

## Report

One section per check. For each finding: the file, what it claims, what is true, and the smallest correction. Separate **must fix** from **worth knowing**.

Say plainly which checks you could not complete and why. An unverified check is not a pass.
