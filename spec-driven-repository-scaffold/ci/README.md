# CI

CI is the same commands as `AGENTS.md`. If they differ, you will debug "works here."

Run on every PR into `v1`. Run on the plan branch if you want faster feedback. Required checks on `v1`. No direct pushes.

Automate what is objective: build, format, types, unit/integration tests, secret/dependency scans you actually trust.

This folder is for the config your host needs (GitHub Actions, etc.). Keep it thin. Do not invent a second test story here.
