# Decision Records

This directory preserves the reason behind consequential product and technical choices.

## When to create a decision record

Create one when a choice:

- Is difficult or costly to reverse
- Introduces a significant dependency
- Changes a trust boundary, data model, public interface, or deployment model
- Selects among meaningful alternatives with different tradeoffs
- Resolves a disagreement or recurring question
- Establishes a rule future work must follow

Do not create a decision record for ordinary local implementation details that can be changed safely within an approved design.

## Naming

```text
ADR-0001-short-descriptive-title.md
ADR-0002-short-descriptive-title.md
```

Use the next available number. Do not reuse numbers.

## Status lifecycle

- Proposed
- Accepted
- Rejected
- Deprecated
- Superseded by `ADR-####`

Accepted records are historical evidence. When a decision changes, create a new record that supersedes the old one rather than rewriting history.

## Decision index

| ID | Title | Status | Date | Supersedes / superseded by |
|---|---|---|---|---|
| ADR-0000 | Template | Template | N/A | N/A |
