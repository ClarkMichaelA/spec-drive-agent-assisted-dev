# 3. User Journeys and Discovery

## Goal of this stage

Describe how people, systems, and operators try to reach an outcome, including what happens when things go wrong.

A user story such as "As a user, I want to upload a file" is too small to explain the complete experience. A journey connects the trigger, prerequisites, normal flow, alternatives, failures, permissions, data, and recovery.

## Where journey information should come from

Prefer real evidence:

- Interviews or workshops
- Existing process documents
- Support tickets
- Screenshots or current-system observations
- Policies and forms
- Logs and measurements
- Subject-matter experts

AI can propose questions and missing paths, but it cannot observe your organization unless you provide evidence.

## Journey contents

For each important journey, capture:

- Actor and goal
- Trigger
- Preconditions
- Main success path
- Alternative paths
- Failure and recovery paths
- Permissions and privacy
- Inputs and outputs
- Audit or record needs
- Acceptance examples
- Open questions

Include administrative and support journeys, not only end-user journeys.

## A productive AI sequence

### Step 1: Identify actors and journey candidates

Ask for a journey map, not detailed requirements yet.

### Step 2: Expand the highest-priority journeys

Start with the main user outcome and the most important operational journey.

### Step 3: Run an edge-case review

Ask separately for:

- Invalid input
- Missing permissions
- Duplicate actions
- Dependency failure
- Partial completion
- Retry and recovery
- Concurrency or stale data
- Sensitive information exposure
- Administrative misuse
- Accessibility and usability barriers, when relevant

### Step 4: Confirm with real users or process owners

Mark proposed behavior as unverified until someone knowledgeable confirms it.

## Copy-ready journey prompt

```text
Read the approved docs/PROJECT.md and the template in docs/USER_JOURNEYS.md.

Create a first draft of the actor inventory and user-journey map. Then fully
expand only the [NUMBER] highest-priority journeys.

Rules:
- Do not invent current business processes or policies.
- Mark proposed behavior that needs stakeholder confirmation.
- Include alternative, failure, recovery, permission, privacy, data, audit,
  and operator/support paths.
- Use stable IDs such as ACT-001 and UJ-001.
- Do not turn candidate behavior into approved requirements yet.
- List no more than five blocking questions; place other uncertainty in the
  journey's open-questions section.

Return:
1. Proposed changes to docs/USER_JOURNEYS.md
2. Assumptions that should be added to docs/ASSUMPTIONS.md
3. The three most important journeys to validate with real users
```

## How to review a journey

Ask yourself:

- Would a real user recognize this process?
- Is the actor trying to accomplish an outcome, not merely click a button?
- Are prerequisites and permissions correct?
- Does the flow explain what the user sees after failure?
- Can a partially completed operation be recovered safely?
- Is sensitive data exposed in screens, logs, exports, or error messages?
- Is there an operator or support path?
- Are unverified ideas clearly marked?

## Exit criteria

Move to requirements when:

- The primary outcomes have realistic journeys.
- Important alternative and failure paths are represented.
- Permissions, data, audit, and support needs are visible.
- Stakeholders have confirmed the important current and desired behavior.
- Unknowns are recorded rather than hidden.
