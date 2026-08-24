---
paths:
  - "TASKS.md"
  - "HANDOFF.md"
---

# State files describe git, not intent

- Verify against git before you trust either file. A handoff that disagrees with git is a stop condition, not a starting point.
- Write these only for work that is actually committed. Done means true on the plan branch, proven by commands that ran.
- Update both before you stop, including when you stop blocked.
- Never record a command as passing if it did not run.
