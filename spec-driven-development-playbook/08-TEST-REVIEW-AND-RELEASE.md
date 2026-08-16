# 8. Test, Review, and Release

Code is not evidence. A passing test that asserts a mock returned a mock is not evidence either.

## Put the rule in a command

A sentence that says "always run tests" will be skipped. A command in `AGENTS.md` that CI also runs will not.

Automate what is objective:

- Build
- Format / types / lint
- Unit and integration tests
- Dependency and secret scans worth running
- The one or two journey tests that prove the phase

Local and CI should be the same commands. If they differ, you will debug "works here."

## Layers you actually need

Use the fewest that would catch a real miss.

- Static checks
- Unit tests for rules
- Integration / contract at a real boundary
- One end-to-end path for the journey that matters
- Security tests only where you have a control to break
- Deploy / rollback tests only if you deploy

Do not clone every case at every layer.

## Two reviews. Not five.

**Implementer** looks at their own diff against the task, the requirement, and the plan. Expected. Not independent.

**Fresh context** looks at the same revision and tries to prove the implementer wrong. That is the test review. Do it after the task, before the next one.

Security is a plan problem first. Task-level security review is a diff against the plan's constraints, only on tasks the plan marked.

If a user can see the change, exercise the UI. A second agent reading JSX and saying "consider affordance" is optional commentary, not a gate.

## Review files

`docs/reviews/` is for things you will need later: a security finding, a waived Must, a release call. It is not a participation trophy for every task.

A useful record: what revision, who looked (and whether they wrote the code), what they ran, findings with severity, what must change, whether it was rechecked.

No findings ≠ secure. It means that reviewer did not prove a problem.

## Release is broader than "tasks are Done"

Before you give this to anyone who can lose something:

- Milestone exit is true, with evidence
- Musts have current tests or a named waiver
- The revision you will ship is the one you tested
- Limits are written down and you accept them
- Deploy and rollback are not theoretical if this is real
- Someone will know when it breaks
- Changelog says what a user would notice

Grok can assemble the packet. You accept the risk.

## Prompts

### Fresh review

```text
Act as the Test Engineer in agents/test-engineer.md. You did not write this.
Read task [T-000], its requirements, the plan, and revision [SHA] with the
full diff. Use the files. Do not review from memory.

Find unmet criteria, tests that do not prove the behavior, missing failure
paths, and scope that is not in the plan.

Required findings need severity, evidence, impact, and a concrete fix.
Optional nits separately. If you cannot tell, say evidence is insufficient.
```

### Release packet

```text
Read the milestone, requirements, plan, TASKS.md, tests, HANDOFF.md,
changelog, and the release revision.

Do not edit files. Return: proven, unproven, open defects, operational
gaps, and Ready / Ready with named conditions / Not Ready.
Do not treat a Done checkbox as proof.
```
