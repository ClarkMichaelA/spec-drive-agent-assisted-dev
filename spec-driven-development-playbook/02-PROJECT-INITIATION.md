# 2. Project Initiation

## Goal of this stage

Turn a rough idea into a brief that a business owner, user, developer, security reviewer, and AI assistant can understand in the same way.

Do not begin with features. Begin with the problem and outcome.

## What you should provide

A useful starting note can be short:

- Who has the problem
- What happens today
- Why it matters
- What better outcome you want
- Known limits, deadlines, systems, or policies
- What is definitely not part of the project
- Facts you know versus things you are assuming

Example structure:

```text
Idea: [one paragraph]
Users: [groups]
Current pain: [what happens now]
Desired result: [what should improve]
Known constraints: [limits]
Not in scope: [exclusions]
Unknowns: [questions]
```

## How AI helps

Ask the AI to:

- Organize the idea into a project brief
- Identify ambiguity and missing evidence
- Separate outcomes from proposed features
- Suggest success measures without inventing baseline or target values
- Find hidden stakeholders and operational concerns
- Identify assumptions that should be tested

Do not ask the AI to decide whether an invented business fact is true.

## Suggested working sequence

### Pass 1: Draft

Give the AI your rough idea and ask it to create `PROJECT.md` using the repository template.

### Pass 2: Critique

In a fresh pass, ask it to identify:

- Ambiguous statements
- Unsupported assumptions
- Scope that is too broad
- Missing users or operators
- Outcomes that are actually features
- Success measures that cannot be observed
- Contradictions and hidden dependencies

### Pass 3: Human review

Check:

- Is this the real problem?
- Are the intended users correct?
- Is the scope narrow enough to deliver?
- Are constraints real and externally imposed?
- Are non-goals explicit?
- Are unknowns still marked as unknown?

### Pass 4: Revise and approve

Have the AI apply only the changes you approve. Set the document status to `Approved` when it is stable enough to drive discovery and requirements.

## Copy-ready initiation prompt

```text
Read README.md, docs/INDEX.md, and the template in docs/PROJECT.md.

I am initiating a project with this rough idea:

[PASTE IDEA, USERS, CURRENT PAIN, DESIRED RESULT, CONSTRAINTS, EXCLUSIONS,
KNOWN FACTS, ASSUMPTIONS, AND UNKNOWNS]

Draft docs/PROJECT.md in plain language.

Rules:
- Do not invent facts, baselines, targets, policies, users, or constraints.
- Clearly separate known facts, assumptions, and open questions.
- Describe outcomes before features.
- Keep the first release scope narrow enough to deliver and demonstrate.
- Suggest no more than five blocking questions. For non-blocking gaps, use
  explicit placeholders or assumptions rather than starting an endless Q&A.
- Do not draft architecture or choose technologies in this step.

Return:
1. The proposed PROJECT.md content
2. A short list of the most important uncertainties
3. A short review checklist for me
```

## Exit criteria

Move to user journeys when:

- The problem is understandable.
- Primary users and stakeholders are named.
- Desired outcomes are distinct from implementation ideas.
- Scope and non-goals are clear enough to prevent obvious drift.
- Constraints are real, not guesses.
- Unknowns and assumptions are visible.
- A human owner has approved the brief as a working source of truth.
