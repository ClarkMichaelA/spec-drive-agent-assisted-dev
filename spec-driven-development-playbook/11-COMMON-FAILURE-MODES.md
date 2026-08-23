# 11. Failure Modes

## 1. Generate the whole spec in one pass

Looks polished. Shares one unverified fantasy.

Fix: approve a layer before it feeds the next.

## 2. "As a user I want…" is not a requirement

Happy path ships. Auth, failure, recovery, and operations do not.

Fix: journeys include failure. Requirements include the ugly cases.

## 3. Architecture before the problem

The database was chosen. Then we asked what the user needs.

Fix: outcomes, then requirements, then the choices those force.

## 4. Fast, secure, scalable

Unfalsifiable. Therefore unused.

Fix: scenario, measure, threshold. Or delete it.

## 5. Invented facts

APIs, laws, prices, "users always…" appear with no source.

Fix: known / assumed / unknown. Verify before Approved.

## 6. One giant instruction file

The coding agent misses the line that mattered.

Fix: `AGENTS.md` stays short. Details live in the file that owns the question.

## 7. The task is a project

One ticket, three outcomes, a hidden ADR, cannot be reviewed.

Fix: that is a plan. Split until a task has one proof.

## 8. "Finish the plan" with no checkpoints

The failure this kit used to invite. Early error repeats. You notice at the end.

Fix: autonomy stops at a **phase**. You use the software. Then continue.

## 9. Implementer "reviews" itself

Same context, new role name, finds commas.

Fix: fresh context, or call it a self-review. Do not file it as independent.

## 10. Test theater

37 tests, all green, none would fail if the feature were deleted.

Fix: map tests to acceptance criteria and the failure the user would hit.

## 11. Checks exist only as prose

"Always run the suite" in a Markdown file.

Fix: commands in `AGENTS.md`. CI runs the same ones.

## 12. Spec edited to match the code

The test was hard, so the Must got softer.

Fix: that is a change request. You approve it. Code does not get a vote.

## 13. Changelog is a commit dump

Users do not care that you renamed a helper.

Fix: observable changes only.

## 14. Trusted a stale handoff

Wrong branch, phantom tests, next task already done.

Fix: verify the repo every start.

## 15. Documents as a quota

More templates than behavior.

Fix: if a file answers no question you have, delete it.

## 16. Premature machinery

Queues, caches, extra services, before a requirement needs them.

Fix: which approved Must dies without this part? If none, no part.

## 17. No one to call when it breaks

Works on your laptop.

Fix: if you will release it, say who sees the fire and how you roll back.

## 18. Endless questions

Planning never ends.

Fix: five blocking questions max. Conservative assumption otherwise. Write it down.

## 19. Role files thought to be orchestration

`agents/*.md` does not start a process, isolate a worktree, or create a second brain.

Fix: the work-plan adapter selects a role. Independence is a fresh context, not a filename.

## 20. GitHub as a second spec

Issues, a Project, and `TASKS.md` all slightly wrong in different ways.

Fix: repo is truth. PR is how a phase lands. That is enough for one person.

## 21. Reviewer swarm

Test + security + UX + docs on every task. Slow. Shallow. Same model family nodding.

Fix: tests always. Fresh test review after implement. Security when the plan marked the task. UI when a user can see it. Docs in the same commit if a spec went false.

## 22. Ticket grooming dressed up as steering

You spent the evening marking Ready.

Fix: approve the plan. The coding agent owns the queue. You own phases.
