# Scaffold source

This directory is source for three rendered scaffold editions. Do not copy `common/` or a target overlay by itself.

```text
common/          runtime-neutral project files
targets/grok/    Grok Build workflow and runtime guide
targets/codex/   Codex skill, reviewer subagents, and runtime guide
targets/claude/  Claude Code instructions, skills, subagents, rules, permissions
```

Run the repository build from the root:

```powershell
./scripts/build-releases.ps1 -Version 2.1.0
```

The build overlays each target on `common/`, generates the rendered manifest, verifies that target-only files do not leak into other editions, and produces one ZIP per runtime.

Shared behavior belongs in `common/`. A target may add runtime discovery and invocation files but may not replace a common file.
