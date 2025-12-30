# AI Context System

This repository provides a tool-agnostic, versioned context system for AI coding tools (Windsurf, Cursor, Claude, Copilot, etc.).
It is designed to be added to projects as a git submodule, then copied into the project root so tools can read it directly.

## Goals

- Provide consistent, high-quality project context for AI assistants
- Keep documentation lightweight, modular, and up to date
- Enable repeatable setup across repositories
- Support deliberate upgrades through versioning

## What This Repo Contains

- `AI.md` — Entry point and behavioural rules for AI assistants
- `docs/` — Context documents (architecture, standards, decisions, project context)
- `updates/MONTHLY-UPDATES-TEMPLATE.md` — Template for monthly work logs
- `scripts/` — Helpers for updating and copying context into projects
- `CONTEXT-VERSION.md` — Track the context system version in use

## Recommended Usage (Submodule + Copy)

This pattern maximises adoption and tool compatibility:

1) Add as a submodule

```bash
git submodule add <git-url> .context
```

2) Copy the context into the project root

```bash
bash .context/scripts/update-context.sh
```

3) Commit the copied files in the project

```bash
git add AI.md docs updates/MONTHLY-UPDATES-TEMPLATE.md .context
git commit -m "chore: add ai context system"
```

## Updating an Existing Project

1) Pull latest submodule changes

```bash
git submodule update --remote --merge
```

2) Re-copy the context files

```bash
bash .context/scripts/update-context.sh
```

3) Commit updated context

```bash
git add AI.md docs updates/MONTHLY-UPDATES-TEMPLATE.md .context
git commit -m "chore: update ai context system"
```

## Using with AI Tools (Tool-Agnostic)

Use the option that matches what you're about to do:

### 1) Session start (always)
```
Read @AI.md and @updates/YYYY-MM.md
```
Replace `YYYY-MM` with the current month (e.g., `2025-01`).

### 2) Before writing code
```
Read @docs/CODING-STANDARDS.md then implement [task]
```

### 3) Before major changes
```
Read @docs/DECISIONS.md and @docs/ARCHITECTURE.md before proceeding
```

If your tool supports file references (e.g., `@filename` in Windsurf/Cursor), use that syntax to load context files.

## Versioning Strategy

- Tag releases (e.g., `v2.1.0`) in this repo
- Pin project submodules to a release tag for stability
- Upgrade deliberately when ready

## Security & Privacy

- Never commit secrets (API keys, tokens, passwords)
- Avoid logging PII or client data in examples
- Redact sensitive values in documentation when needed

## Upgrade Checklist

1) Pull the latest submodule changes  
2) Run the update script to copy files  
3) Review diffs in `AI.md`, `docs/`, and `updates/MONTHLY-UPDATES-TEMPLATE.md`  
4) Commit the updated context  

## Notes

- The monthly update files (`updates/YYYY-MM.md`) live in the project and are not overwritten by the update script.
- This repo is intentionally tool-agnostic and should work with any AI coding assistant.
