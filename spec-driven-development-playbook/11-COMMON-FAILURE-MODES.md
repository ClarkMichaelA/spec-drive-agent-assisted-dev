# 11. Common Failure Modes and Corrections

## 1. Generating every document in one pass

**Symptom:** The project brief, requirements, architecture, roadmap, and tasks all look polished but share the same unverified assumptions.

**Correction:** Draft, critique, human-review, and approve one layer before deriving the next.

## 2. Treating user stories as complete requirements

**Symptom:** Happy-path features exist, but permissions, errors, recovery, audit, data quality, and operations are missing.

**Correction:** Expand journeys and create explicit quality, security, data, operational, and integration requirements.

## 3. Creating decisions before understanding requirements

**Symptom:** Technology choices drive scope and business behavior.

**Correction:** Establish outcomes and requirements first. Record genuine external constraints separately.

## 4. Vague requirements

**Symptom:** Words such as fast, secure, scalable, simple, intuitive, and reliable appear without conditions or evidence.

**Correction:** Define scenario, measure, threshold or observable behavior, and verification method. Leave unknown values as TBD.

## 5. AI invents plausible facts

**Symptom:** Baselines, policies, API behavior, licensing, regulations, user needs, or environment details appear without a source.

**Correction:** Require known/assumed/unknown labels and authoritative verification before approval.

## 6. One giant working-agreement file

**Symptom:** The assistant receives too much context, overlooks key instructions, and documentation becomes hard to maintain.

**Correction:** Keep the root agreement concise and use an index with links to relevant detailed documents.

## 7. Task is really a project

**Symptom:** One task touches many components, introduces decisions, contains several outcomes, and cannot be reviewed coherently.

**Correction:** Create an implementation plan, identify dependencies, and split into vertical, testable tasks.

## 8. Asking an agent to finish the whole backlog

**Symptom:** Early errors propagate, context degrades, task states become unreliable, and review occurs too late.

**Correction:** Use one task or a small bounded batch with explicit stop conditions and validation after each task.

## 9. The implementer is the only reviewer

**Symptom:** The review repeats the implementation's assumptions and finds mostly cosmetic issues.

**Correction:** Use a fresh context for independent review on medium- and high-risk changes.

## 10. Test theater

**Symptom:** Many tests pass, but they assert implementation details, avoid failure paths, or do not prove requirements.

**Correction:** Map tests to acceptance criteria and important user, security, data, and operational behavior.

## 11. Required checks exist only as prose

**Symptom:** Contributors forget or skip checks.

**Correction:** Put commands in the working agreement and enforce objective rules through scripts and automated gates.

## 12. The AI edits approved documents to match its code

**Symptom:** Requirements become weaker after implementation difficulty appears.

**Correction:** Use formal change control. Code must follow approved intent unless the appropriate owner approves a change.

## 13. Changelog becomes an engineering diary

**Symptom:** Every refactor and test edit creates noise for users.

**Correction:** Reserve changelog entries for observable user or operator changes. Use task and source-control history for implementation detail.

## 14. Handoff is trusted without verification

**Symptom:** The next session works from stale branch, test, or task information.

**Correction:** Verify repository state at the start of every session.

## 15. Too many documents for the project

**Symptom:** More time is spent maintaining templates than reducing risk or delivering value.

**Correction:** Combine artifacts for small projects. Separate them only when they answer different questions or need different approval and update policies.

## 16. Premature architecture complexity

**Symptom:** Queues, caches, distributed services, elaborate abstractions, or multiple data stores appear before requirements justify them.

**Correction:** Ask which approved requirement requires each component. Prefer reversible and simple choices.

## 17. No operational owner

**Symptom:** The feature works in a development environment but nobody owns alerts, recovery, configuration, or support.

**Correction:** Include operational journeys and requirements before release planning.

## 18. Endless clarification

**Symptom:** The AI asks one question at a time and planning never converges.

**Correction:** Limit blocking questions, allow explicit conservative assumptions for low-impact gaps, and record open questions with an owner and needed-by date.

## 19. Treating role files as orchestration

**Symptom:** A team assumes that adding Markdown files under `agents/` launches separate assistants, assigns work, isolates changes, or guarantees parallel execution.

**Correction:** Treat role files as portable responsibility and boundary definitions. Select them explicitly through tasks or prompts, and configure runtime orchestration separately when parallel execution is actually needed.

## 20. Renaming self-review as independent review

**Symptom:** The implementer switches to a reviewer role in the same context and records the result as independent.

**Correction:** Label it as self-review or non-independent review. When risk requires independence, use a separate assistant session, invocation, model, or human reviewer that did not produce the work, and record the reviewer and revision durably.
