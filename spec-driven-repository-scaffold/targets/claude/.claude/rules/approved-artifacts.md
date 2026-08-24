---
paths:
  - "docs/plans/active/**"
  - "docs/decisions/**"
  - "docs/REQUIREMENTS.md"
  - "docs/ARCHITECTURE.md"
---

# You are reading an authority file

Check the Status line. If it says Approved or Accepted, the human owns this file.

- Do not edit it to match code you just wrote. That is the failure this rule exists to stop.
- A material plan change needs human re-approval, including added scope, a changed phase boundary, and a new dependency.
- A new Must, a changed public interface, a migration, or a trust-boundary change is a decision, not an edit. Stop and propose one.
- Correcting a typo or a broken link is fine. Changing what the file requires is not.

When this file and the code disagree, say so and stop. Do not pick a winner.
