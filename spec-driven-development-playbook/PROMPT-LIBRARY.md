# Prompt Library

These prompts are intentionally vendor-neutral. Replace bracketed placeholders and point the assistant to repository files rather than pasting the entire project repeatedly.

## A reusable prompt structure

A strong prompt usually contains:

1. **Context:** which approved files and evidence to read
2. **Role:** which specialized perspective applies, when the repository defines one
3. **Goal:** one clear result
4. **Boundaries:** what may and may not change
5. **Quality bar:** how to evaluate the result
6. **Output:** exact artifacts or report structure
7. **Stop conditions:** when not to guess

A useful default rule block is:

```text
General rules:
- Do not invent facts, business rules, external behavior, measurements, or
  approvals.
- Separate known facts, assumptions, and unknowns.
- Preserve stable IDs and links among artifacts.
- Do not silently change approved scope, requirements, or decisions.
- For low-impact reversible gaps, use a conservative stated assumption.
- For high-impact or difficult-to-reverse ambiguity, stop and propose options.
- Return evidence and limitations, not just confident conclusions.
```

When the scaffold's role system is in use, add:

```text
Act as the [ROLE] defined in agents/[ROLE-FILE].md. Follow AGENTS.md first;
the role supplements but does not override it. Identify the active role, do not
switch roles silently, and record durable state rather than relying on chat.
```

Selecting a reviewer role does not make a review independent. Use a reviewer that did not produce the work when independence is required, and record the independence status honestly.

## 1. Turn a rough idea into a project brief

```text
Act as the Project Analyst role defined in agents/project-analyst.md.
Read the project scaffold README, documentation index, and PROJECT.md template.

My rough idea is:
[PASTE IDEA]

Draft PROJECT.md with problem, users, outcomes, success measures, scope,
non-goals, constraints, assumptions, open questions, dependencies, and owners.

Do not invent baselines, targets, policies, constraints, or current-process
facts. Suggest at most five blocking questions. Keep architecture and technology
choices out of this step.
```

## 2. Critique a project brief

```text
Review docs/PROJECT.md as a skeptical product, delivery, operations, and risk
reviewer. Do not rewrite it yet.

Find ambiguous language, unsupported assumptions, features disguised as
outcomes, missing stakeholders, unmeasurable success, scope creep, conflicting
constraints, hidden dependencies, and missing non-goals.

Return findings by severity with the exact section, why it matters, and a
specific proposed correction. Separate blocking issues from optional polish.
```

## 3. Generate actor and journey candidates

```text
Read approved PROJECT.md and docs/user_journeys/ (README index and templates).

Create an actor inventory and journey map. Fully expand only the [NUMBER]
highest-priority journeys as separate files under docs/user_journeys/. Include
triggers, preconditions, success paths, alternatives, failures, recovery,
permissions, privacy, data, audit, and support behavior.

Mark unverified process details. Do not turn candidates into approved
requirements.
```

## 4. Find journey edge cases

```text
Review journeys [UJ-IDS]. Focus only on overlooked paths.

Check invalid and missing input, permissions, duplicate actions, timeouts,
partial failure, retries, recovery, stale data, concurrent actions, sensitive
information exposure, administrative misuse, accessibility, and support needs.

Return proposed additions with a reason and stakeholder question. Do not invent
current policy.
```

## 5. Draft requirements

```text
Act as the Project Analyst role defined in agents/project-analyst.md.
Read approved PROJECT.md and docs/user_journeys/ plus REQUIREMENTS.md.

Draft traceable functional, quality, security/privacy, data, operational, and
integration requirements. Use stable IDs, sources, acceptance criteria, and
verification methods.

Do not invent target values or external facts. Mark them TBD with an owner.
Do not prescribe architecture unless an approved external constraint requires it.
```

## 6. Perform a requirements quality review

```text
Review REQUIREMENTS.md without changing it.

Find ambiguity, unverifiable language, multiple ideas in one requirement,
duplicates, conflicts, missing sources, missing failure behavior, hidden design
choices, scope expansion, and absent security/data/operations needs.

For each finding give severity, affected IDs, evidence, and a replacement or
resolution approach. Identify requirements that need authoritative external
fact verification.
```

## 7. Identify decision-record candidates

```text
Read approved requirements, constraints, existing decisions, risks, and the
architecture template.

List only consequential decisions needed for the next milestone. For each,
state the question, drivers, reversibility, options, evidence needed, and
approver. Do not create records for ordinary local implementation details.
```

## 8. Draft one decision record

```text
Draft decision record [ADR-ID] for this decision question:
[QUESTION]

Use the approved requirements and constraints as decision criteria. Compare
realistic options, state assumptions and evidence gaps, recommend an option,
and explain positive and negative consequences, follow-up work, and revisit
triggers.

Do not invent product capabilities, prices, licensing, standards, or external
facts. Mark facts that must be verified before acceptance.
```

## 9. Draft architecture

```text
Act as the Solution Architect role defined in agents/solution-architect.md.
Read the approved project brief, requirements, accepted decisions, risks,
security needs, and ARCHITECTURE.md template.

Draft the simplest architecture that satisfies the requirements. Include
context, components, flows and failures, data, interfaces, trust boundaries,
deployment, reliability, observability, operations, tradeoffs, and requirement
mapping.

Flag unapproved decisions and unverified external assumptions. Do not hide them
inside the design.
```

## 10. Challenge architecture

```text
In a context that did not produce the architecture, act as the Solution
Architect role defined in agents/solution-architect.md and perform an independent
review. Do not assume the draft is sound.

Check requirement coverage, unnecessary complexity, component responsibilities,
data ownership, trust boundaries, failure modes, single points of failure,
compatibility, deployment, rollback, observability, supportability, capacity,
and unverified external assumptions.

Return required findings and optional improvements separately. For each finding
include evidence, impact, and a concrete correction or decision needed.
```

## 11. Perform a security and abuse-case review

```text
Act as the Security Reviewer role defined in agents/security-reviewer.md.
Read PROJECT.md, REQUIREMENTS.md, ARCHITECTURE.md, DATA_MODEL.md, API.md, and
SECURITY.md where applicable.

Identify assets, actors, entry points, trust boundaries, sensitive data,
privileged actions, threats, abuse cases, controls, audit events, and tests.
Focus on unauthorized access, privilege escalation, injection, data leakage,
object/tenant isolation, duplicate or replayed actions, denial of service,
dependency risk, and insider misuse.

Do not assume a control exists merely because it is common. Link proposed
controls to requirements and verification evidence.
```

## 12. Create an outcome roadmap

```text
Read approved outcomes, requirements, architecture, assumptions, and risks.

Create an outcome-based roadmap. Start with a thin walking skeleton. For each
milestone state outcome, users, included requirements, exclusions, dependencies,
risks reduced, and exit evidence.

Do not invent dates or capacity. Do not turn milestones into component task lists.
```

## 13. Draft an implementation plan

```text
Read milestone [M-00], its approved requirements, decisions, architecture,
security/operations needs, and the implementation-plan template.

Draft one plan with current state, target behavior, scope, components, data and
interface changes, security, ordered phases, tests, deployment, migration,
rollback, observability, risks, assumptions, and proposed task boundaries.

Stop before task generation if an unresolved consequential decision or
high-impact ambiguity remains.
```

## 14. Decompose a plan into tasks

```text
Read approved plan [PATH] and TASKS.md.

Create small dependency-ordered tasks. Each task needs stable ID, objective,
reason, links, scope, out-of-scope, acceptance criteria, validation, and risks.
Assign a primary role and required review roles from agents/, or explicitly
state None. Keep Owner separate and do not invent a fictional owner. Initialize
review-record paths accurately. Prefer vertical demonstrable slices. Mark Ready
only when Definition of Ready is satisfied. Do not bury decisions or scope
changes in tasks.
```

## 15. Review task quality

```text
Review proposed tasks for plan [PATH] without implementing them.

Find tasks that are too large, have multiple outcomes, lack dependencies, use
vague acceptance criteria, omit failure/security/data/operations behavior,
cannot be validated independently, or contain hidden design decisions.

Return a corrected dependency order and specific split/merge recommendations.
```

## 16. Implement exactly one task

```text
Act as the primary role named by task [T-000] and read its file under agents/.
Read the repository working agreement first, then the documentation index,
handoff, task [T-000], and only its linked context. Verify repository state
first and identify the active role.

Complete exactly this Ready task: plan briefly, implement minimally, add tests,
run required checks, review the diff, correct defects, update affected project
state, and stop.

Do not expand scope or introduce an unapproved consequential decision. Report
exact checks and results; never claim a check ran when it did not.
```

## 17. Implement a bounded batch

```text
Complete up to [NUMBER, NORMALLY 2 OR 3] Ready tasks from the same approved
plan. They must require no new architecture decision and share the same risk
boundary.

After each task, run its required validation and update task state. Run full
validation at the end. Stop immediately on failure, conflict, ambiguity, scope
expansion, or unexpected migration/security impact.
```

## 18. Independently review a change

```text
Act as required review role [ROLE] defined in [ROLE FILE]. In a context that did
not produce the implementation, review task [T-000], linked requirements and
design, revision [REVISION], and the complete diff. Do not modify production
files during the initial review and do not assume correctness.

Find unmet criteria, logic defects, security/privacy issues, data-integrity or
concurrency problems, weak error/recovery handling, compatibility risk, weak
tests, unnecessary complexity, and documentation drift.

Give severity, evidence, impact, and exact correction. Separate required defects
from optional improvements. Record reviewer role, reviewer identity or assistant
label, independence status, scope, evidence, findings, actions, owners,
disposition, and reverification needs under docs/reviews/. Link the record from
TASKS.md and HANDOFF.md where applicable.
```

## 19. Fix approved review findings

```text
Act as the Software Engineer role defined in agents/software-engineer.md.
Read review record [PATH] and task [T-000]. Correct only findings [F-IDS] that
are approved for this change.

Preserve original task scope unless an approved change request says otherwise.
Add regression tests, run required validation, update finding and task status,
and report exact evidence. Stop if a finding requires a new consequential
decision or scope change.
```

## 20. Generate missing tests from requirements

```text
Act as the Test Engineer role defined in agents/test-engineer.md.
Read requirements [IDS], their journeys, implementation, and existing tests.

Identify the smallest set of missing tests needed to prove success, boundary,
failure, permission, data-integrity, retry/recovery, and operational behavior.
Do not duplicate coverage at every layer. Explain which requirement and risk
each proposed test protects before implementing it.
```

## 21. Reconcile documentation after a change

```text
Act as the Documentation Reviewer role defined in
agents/documentation-reviewer.md.
Read the completed task, diff, test results, and project documentation.

Find documents that became false, incomplete, or stale. Propose only necessary
updates. Do not rewrite approved requirements to match accidental code behavior.
Distinguish documentation correction from a product or architecture change that
requires approval. Record substantive findings under docs/reviews/. State
whether the review is independent, self-review, or otherwise non-independent.
```

## 22. Update the handoff

```text
Verify actual repository state, current revision, uncommitted changes, task
status, changed files, and test results.

Update HANDOFF.md with completed work, work in progress, exact validation,
known failures, decisions, assumptions, blockers, environment notes, and the
safest next task. Include current primary role, required next review, and related
review-record path. Do not include secrets or unsupported claims.
```

## 23. Resume a project safely

```text
Read the working agreement, documentation index, handoff, and tasks. Verify the
handoff against repository state, relevant tests, and review records. If the
current task selects a role, read that role file and identify it.

Report confirmed state, mismatches, current milestone, highest-priority Ready
task with completed dependencies, context needed, and blockers. Do not change
files yet.
```

## 24. Prepare a change proposal

```text
A discovery may require changing approved intent or design:
[DISCOVERY AND EVIDENCE]

Analyze affected outcomes, requirements, decisions, architecture, plans, tasks,
tests, risks, and release claims. Return current state, proposed change, options,
impacts, recommendation, approvers, and follow-up work. Do not edit files yet.
```

## 25. Triage a defect

```text
Evidence of a possible defect:
[REPRODUCTION, LOGS, SCREENSHOT DESCRIPTION, TEST FAILURE, OR REPORT]

Identify expected behavior and its source, reproduce when possible, narrow the
likely cause, assess severity and affected users/data, propose a minimal fix and
regression test, and identify any containment needed.

Separate verified evidence from hypotheses. Do not change intended behavior
without approval.
```

## 26. Plan a refactor

```text
The following area has a maintainability or risk problem:
[AREA AND EVIDENCE]

Read architecture, requirements, tests, and affected code. Propose a staged
refactor that preserves approved behavior, identifies protected contracts,
adds missing characterization tests, limits scope, and allows rollback.

Explain why the refactor is needed now. Do not combine unrelated features.
```

## 27. Release-readiness review

```text
Read the milestone, requirements, traceability, completed plan, tasks, tests,
security, operations, risks, changelog, and release candidate.

Return proven criteria, missing or stale evidence, open defects and limitations,
security/operations readiness, communication gaps, and a recommendation of
Ready, Ready with explicit conditions, or Not Ready. Cite concrete evidence.
```

## 28. End-of-session standing instruction

```text
At the end of every task or work session, produce a concise handoff containing:
- Completed changes
- Files modified
- Tests and checks run with exact results
- Remaining issues, risks, assumptions, and blockers
- Task and documentation updates
- Recommended next task or next prompt

Update HANDOFF.md and TASKS.md to match actual repository state. Never include
secrets or claim unverified success. Preserve the current primary role, required
next review, and related review-record path.
```
