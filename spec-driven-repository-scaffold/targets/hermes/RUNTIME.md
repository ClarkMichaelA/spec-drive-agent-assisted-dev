# Runtime: Hermes Agent

This scaffold maps the portable delivery method onto four Hermes profiles. Hermes supplies identity and fresh sessions; the repository remains the project memory and authority.

| Piece | File | Hermes behavior |
| --- | --- | --- |
| Persistent project instructions | `AGENTS.md` | Loaded natively from the repository tree |
| Portable role prompts | `agents/` | Selected by each profile's thin `SOUL.md` |
| Delivery contract | `docs/WORK_PLAN.md` | Read and executed without changing its semantics |
| Lead / orchestrator | `.hermes/profiles/spec-driven-lead/` | Analyst + Architect perspectives; no implementation role |
| Engineer | `.hermes/profiles/spec-driven-engineer/` | Implements the next authorized task |
| Test Reviewer | `.hermes/profiles/spec-driven-test-reviewer/` | Fresh-context verification after implementation |
| Security Reviewer | `.hermes/profiles/spec-driven-security-reviewer/` | Conditional fresh-context security review |

## Install for one project

Run these commands from the project root. Use project-specific profile names so sessions and configuration do not mix across repositories:

```powershell
hermes profile install .hermes/profiles/spec-driven-lead --name my-project-lead --alias
hermes profile install .hermes/profiles/spec-driven-engineer --name my-project-engineer --alias
hermes profile install .hermes/profiles/spec-driven-test-reviewer --name my-project-test-reviewer --alias
hermes profile install .hermes/profiles/spec-driven-security-reviewer --name my-project-security-reviewer --alias
```

Replace `my-project` with a short project identifier. Then configure model access for each installed profile with its generated alias, for example `my-project-lead setup`. The distributions deliberately do not pin a model, provider, API key, working directory, or personal approval preference.

Start each profile from the project root so Hermes discovers `AGENTS.md` and relative project files:

```powershell
my-project-lead chat
my-project-engineer chat
my-project-test-reviewer chat
my-project-security-reviewer chat
```

## Repository truth

The supplied profile configs disable persistent memory, user-profile injection, and session-recall tools. Identity persists; project beliefs do not become authoritative outside the repository.

```text
Approved repository files + git  = authority
Hermes chat, Bot messages, board = communication and execution state
```

A decision discussed by profiles is not accepted until it is recorded in the owning repository artifact. When chat, a profile session, Kanban, `TASKS.md`, `HANDOFF.md`, or git disagree, stop and reconcile them using the authority order in `AGENTS.md`.

Do not add `.hermes.md` or `HERMES.md` merely to restate `AGENTS.md`. Hermes gives those files higher project-context priority and would stop loading the shared working agreement as its selected project context.

## Independent review

A separate profile is necessary but not sufficient for an independent review. Start a new Test Reviewer session after implementation and give it the task, linked requirements, plan, and current SHA or diff. Do the same with the Security Reviewer only when the plan or change requires it.

Hermes Bot Mode uses a persistent canonical chat per Bot. Reusing a chat that saw the implementation reasoning is not fresh context. Use a new CLI/TUI session or a newly dispatched worker, and label any review that retained implementation context as a self-review.

Profiles are not filesystem sandboxes. The Test and Security `SOUL.md` files prohibit production edits, but the local terminal backend still runs with the user's OS permissions. Use a container or other OS boundary when enforced read-only access is required; otherwise describe the restriction honestly as behavioral.

## Kanban is optional

Kanban can route work among named profiles and isolate coding work in worktrees. It must remain an execution mirror:

- Create cards only for tasks already authorized by the Approved plan.
- Put the plan task identifier, acceptance criteria, and source revision in the card.
- Update repository state files before completing a card.
- Never treat a board status, comment, or attachment as an accepted requirement or decision.
- Stop on divergence instead of choosing whichever state is convenient.

The initial adapter does not automate plan-to-board synchronization. It also does not force the portable test-plus-conditional-security review contract into Kanban's single same-card review slot. Use explicit reviewer sessions until a lossless review-chain design exists.

## Direct fallback

If profiles are unavailable, run Hermes from the project root, ask it to read `AGENTS.md`, select the relevant file under `agents/`, and execute `docs/WORK_PLAN.md` directly. Label same-session review as self-review.

Official references: [profiles](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/profiles.md), [profile distributions](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/profile-distributions.md), [configuration](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/configuration.md), and [Kanban](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/features/kanban.md).
