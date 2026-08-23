# CI

CI is the same commands as `AGENTS.md`. If they differ, you will debug "works here."

Run on every PR into `main`. Run on the plan branch for faster feedback. Require checks on `main`; do not push directly.

Automate what is objective: build, format, types, unit/integration tests, secret/dependency scans you actually trust.

This folder is for the config your host needs (GitHub Actions, etc.). Keep it thin. Do not invent a second test story here.
