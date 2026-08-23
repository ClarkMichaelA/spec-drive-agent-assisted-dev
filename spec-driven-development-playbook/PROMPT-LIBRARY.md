# Prompt Library

Point the coding agent at files. Do not paste the project. Replace brackets.

Default rules, reuse them:

```text
- Do not invent facts, rules, outside behavior, or approvals.
- Known / assumed / unknown. Never "sounds right."
- Do not silently change Approved scope, requirements, or decisions.
- Cheap reversible gap: conservative assumption, write it down.
- Expensive gap: stop. Options, not a guess.
- If a check did not run, say so.
```

When a role applies:

```text
Act as the [ROLE] in agents/[file].md. AGENTS.md wins if they conflict.
Do not switch roles silently. Same context reviewing its own work is a self-review.
```

## 1. Brief

```text
Act as the Project Analyst in agents/project-analyst.md.
Read docs/INDEX.md and docs/PROJECT.md.

My idea:
[PASTE]

Draft PROJECT.md. Outcomes before features. No invented baselines, policies,
or constraints. At most five blocking questions. No architecture in this step.
```

## 2. Attack the brief

```text
Act as the Project Analyst. Review docs/PROJECT.md. Do not rewrite it.

Find invented facts, features dressed as outcomes, missing non-goals,
unmeasurable success, and fake constraints.

Severity, section, why it matters, a replacement. If you wrote this brief
in this chat, this is a self-review. Do not approve it.
```

## 3. Journeys

```text
Act as the Project Analyst.
Read approved PROJECT.md and docs/user_journeys/.

Map actors and journeys. Fully write only the [N] most important as files
under docs/user_journeys/. Include failure, recovery, permissions, data.

Do not invent current process. Do not promote this to requirements.
```

## 4. Journey edges

```text
Act as the Project Analyst. Review journeys [UJ-IDS] for missing paths only:
bad input, permissions, duplicates, timeouts, partial failure, retries,
stale data, races, leaks, admin misuse.

Propose additions with a reason. No invented policy.
```

## 5. Requirements

```text
Act as the Project Analyst.
Read approved PROJECT.md, journeys, and REQUIREMENTS.md.

Draft testable requirements with stable IDs and acceptance criteria.
Include security, data, ops, and integration only where the brief and
journeys force them. TBD stays TBD. No architecture unless a named
external constraint requires it. Delete anything I could not falsify.
```

## 6. Attack the requirements

```text
Act as the Project Analyst. Review REQUIREMENTS.md. Do not edit.

Find mush, two ideas in one Must, hidden design, missing failure/auth/data,
and scope that is not in the brief.

If you wrote these, label self-review. Do not approve.
```

## 7. Decision candidates

```text
Act as the Solution Architect in agents/solution-architect.md.
Read approved requirements and existing decisions.

List only choices that are expensive to reverse before the next milestone.
Question, drivers, options, what must be verified, who decides.
No ADRs for local coding taste.
```

## 8. One ADR

```text
Act as the Solution Architect. Draft ADR [ID] for:
[QUESTION]

Use approved requirements as criteria. Compare real options. Mark unverified
external facts. Recommend one. Do not invent product capabilities.
```

## 9. Architecture

```text
Act as the Solution Architect.
Read approved brief, requirements, accepted ADRs, and ARCHITECTURE.md.

Draft the simplest design that satisfies the Musts. Call out unapproved
decisions and unverified outside facts. If a part does not defend a Must,
delete it.
```

## 10. Attack the architecture

```text
In a context that did not write the architecture, review it.
Do not assume it is sound.

Look for extra parts, missing failure, weak trust boundaries, and Musts
with no home. Required vs optional. Evidence for each required finding.
```

## 11. Security of the design

```text
Act as the Security Reviewer in agents/security-reviewer.md.
Read PROJECT, REQUIREMENTS, ARCHITECTURE, and SECURITY if they exist.

Assets, entry points, trust boundaries, abuse cases, controls, tests.
Do not assume a control exists because it is fashionable.
```

## 12. Roadmap

```text
Act as the Solution Architect.
Read approved outcomes, requirements, architecture, risks.

Outcome roadmap. First milestone is a walking skeleton. No dates I did not
give. No component shopping list.
```

## 13. Plan (the delivery gate)

```text
Act as the Solution Architect.
Read milestone [M-00], approved requirements, ADRs, architecture, and the
plan template.

Draft one plan: current state, target, in/out, 2-4 phases I can run or see,
review policy (which reviews, when), stop conditions, tests, rollback if
real, and a task breakdown with acceptance criteria.

If an expensive question is open, list it and stop. Do not ask me to Ready
tasks later. Approving this plan authorizes the queue.
```

## 14. Attack the plan

```text
Review the draft plan. Do not implement.

Find phases I cannot inspect, tasks that are projects, theater reviews,
missing stops, and decisions hiding in tasks. Return a tighter plan.
```

## 15. Work the plan

```text
The plan at [PATH] is Approved. Follow AGENTS.md.

Work until the next phase checkpoint or a stop condition.
One task at a time: implement, test, fresh review if required, fix,
commit on the plan branch, do not merge to main.

Stop if the plan is wrong, a new expensive decision appears, or checks
stay red. Then tell me what exists and what to look at.

Prefer the work-plan entry point named in `RUNTIME.md` when the repository has it.
```

## 16. One task (inner)

```text
Act as the Software Engineer in agents/software-engineer.md.
Read AGENTS.md, the approved plan, HANDOFF.md, TASKS.md.
Take the next authorized task only.

Smallest change, tests, required commands, update state, commit on this
branch, do not merge to main, stop. Do not invent requirements.
```

## 17. Fresh review

```text
Act as [Test Engineer | Security Reviewer] in the matching agents/ file.
You did not produce this. Read task [T-000], linked specs, and revision
[SHA] with the full diff. Use the files.

Required findings: severity, evidence, impact, fix.
Optional nits separately. Do not edit production code in this pass.
```

## 18. Fix findings

```text
Act as the Software Engineer. Read review [notes] and task [T-000].
Fix only required findings [IDs]. Add regression tests. Run checks.
Stop if a finding is really a new decision.
```

## 19. Missing tests

```text
Act as the Test Engineer.
Read requirements [IDS], the implementation, and existing tests.
Propose the smallest set that would fail if the behavior were deleted.
Then add them.
```

## 20. Docs after a phase

```text
Act as the Documentation Reviewer in agents/documentation-reviewer.md.
Read the phase diff, tests, and specs.

Find files that are now false. Only necessary edits. Do not weaken a Must
to match the code.
```

## 21. Resume

```text
Read AGENTS.md, the approved plan, HANDOFF.md, TASKS.md.
Verify branch, SHA, dirty tree, and whether cited tests exist.
Report what is actually true and the next action. Do not edit yet.
```

## 22. Change the spec

```text
Discovery:
[EVIDENCE]

Do not edit yet. Current approved state, options (including do nothing),
blast radius, recommendation. Analyst for product/scope; Architect for
shape/interface/data.
```

## 23. Defect

```text
Act as the Software Engineer. If this looks like a security problem, stop
and say so.

Evidence:
[REPRO / LOG / TEST]

Expected behavior and its source, likely cause, smallest fix, regression
test. Do not change intended behavior.
```

## 24. Refactor

```text
This area is expensive to change:
[AREA AND EVIDENCE]

Propose a staged refactor that keeps approved behavior, names the
contracts tests must protect, and can be undone. No feature pile-on.
Architect if shape changes; Engineer if it is local.
```

## 25. Release look

```text
Read the milestone, plan, TASKS.md, tests, HANDOFF.md, changelog, and
the SHA you would ship.

Proven / unproven / Not Ready. A Done checkbox is not proof.
```

## 26. Close the session

```text
Update HANDOFF.md and TASKS.md to match git: plan, phase, branch, SHA,
last task, commands and results, what is still false, next task or
phase checkpoint. No secrets.
```
