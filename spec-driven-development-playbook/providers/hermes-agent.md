# Hermes Agent

The Hermes edition keeps the portable method in the repository and adds four installable Hermes profiles. The profiles provide independent identity and session state; they do not replace `AGENTS.md`, the Approved plan, or git as the project's authority.

| Capability | File |
| --- | --- |
| Persistent repository guidance | `AGENTS.md` (loaded natively by Hermes) |
| Lead / orchestrator identity | `.hermes/profiles/spec-driven-lead/` |
| Implementation identity | `.hermes/profiles/spec-driven-engineer/` |
| Independent test identity | `.hermes/profiles/spec-driven-test-reviewer/` |
| Conditional security identity | `.hermes/profiles/spec-driven-security-reviewer/` |
| Delivery contract | `docs/WORK_PLAN.md` |
| Runtime-specific usage and safety | `RUNTIME.md` |

## Why four profiles

A profile exists only when state, capability, model choice, or review independence should differ. The Lead selects the Project Analyst or Solution Architect perspective from `agents/`; the Engineer implements; the Test Reviewer starts fresh after implementation; and the Security Reviewer runs only for marked security-relevant work. Documentation review stays a conditional responsibility, not a fifth persistent agent.

The checked-in `SOUL.md` files are thin adapters. Each points back to the portable role files instead of copying them. Model and provider settings remain user-owned. Profile memory and session recall tools are disabled so stale beliefs cannot outrank repository specifications.

## Start without Kanban

Install the four local profile distributions, give them project-specific names, and start each from the project root. Use a new reviewer session for each independent review. Hermes profiles do not sandbox filesystem access, so the reviewer write restriction is a behavioral contract unless you also provide an OS or container boundary.

Kanban is optional. It can mirror active execution and provide durable routing, but it is not a second specification or task authority. A card must identify the Approved plan task and revision, and repository state must be updated before the card is completed. The initial Hermes adapter does not auto-import plans into Kanban because automatic two-way synchronization would create an avoidable split-brain state model.

Read the rendered `RUNTIME.md` for installation commands, fresh-context review rules, and the direct-contract fallback.

Official references: [profiles](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/profiles.md), [profile distributions](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/profile-distributions.md), [configuration and project context](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/configuration.md), and [Kanban](https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/features/kanban.md).
