# AI Context System Bootstrap

Copy this file to any repository and run the prompt below to initialise the AI context system.

---

## Quick Start

**Copy this file to your repo root, then use this prompt:**

```
Read @BOOTSTRAP.md and execute the initialisation process for this repository.
```

---

## Initialisation Prompt

Copy everything between `---BEGIN PROMPT---` and `---END PROMPT---`:

```
---BEGIN PROMPT---

# Initialise AI Context System

You are setting up a comprehensive AI context system for this repository. This system ensures AI assistants have full project understanding and maintain documentation as the project evolves.

## Step 1: Analyse the Repository

Follow this structured scan strategy:

### 1.1 Read Core Files First
- `README.md` — Project purpose, setup instructions
- `package.json`, `sfdx-project.json`, `requirements.txt`, or equivalent — Dependencies, project name
- `.gitignore` — What's excluded (helps understand structure)

### 1.2 Map the Structure
- List top-level directories
- Identify source code folders vs config/docs/assets
- Note the main entry points

### 1.3 Identify Key Components
- Use `rg` or grep to find: main classes, controllers, services, API endpoints
- Look for: `export`, `class`, `def`, `function`, `@AuraEnabled`, `@RestResource`
- Limit to **top 10-15 most important** components

### 1.4 Skip Unless Needed
- Large metadata folders (e.g., `/objects/` with 600+ items)
- Binary files, images, fonts
- CSV/data files
- `node_modules/`, `.sfdx/`, `.sf/`, cache folders
- Generated files

### 1.5 Gather Context
- **Project identity**: Name, purpose, client/owner
- **Tech stack**: Languages, frameworks, dependencies
- **Key components**: Main classes, functions, entry points (top 10-15)
- **Data model**: Key entities and relationships only
- **Integrations**: External APIs, services
- **Recent history**: `git log -10 --oneline` for recent work

## Step 2: Create Folder Structure

Create these folders if they don't exist:
- `/docs/`
- `/updates/`

## Step 3: Create AI.md (Entry Point)

Create `AI.md` in the repository root with this structure:

```markdown
# AI Assistant Context

**Read this file at session start.** It tells you how to work on this project and where to find detailed context.

---

## Project Summary

| | |
|---|---|
| **Project** | [Name] |
| **Client** | [Client/Owner] |
| **Environment** | [Dev/Staging/Prod details] |
| **Stack** | [Key technologies] |

---

## Your Behaviour

1. **Implement changes directly** — Generate and apply code; don't just suggest (unless asked for analysis/planning only)
2. **British English** — Use British spelling (colour, organisation, behaviour)
3. **Be concise** — No unnecessary preamble
4. **Proactive updates** — Update monthly file after significant work without being asked

### Safe Defaults

- **Never run destructive commands** without explicit confirmation (delete, drop, rm -rf, force push)
- **Never deploy** without asking — validation only unless instructed
- **Never expose credentials** — mask API keys, passwords, org IDs in outputs
- **Use `rg` for search** — prefer ripgrep over grep for speed and safety
- **Ask before network calls** — don't make external API calls without approval

### Commit Policy

**When to commit:**
- ✅ After each meaningful change (small, regular commits)
- ✅ After code, config, or documentation updates
- ❌ Do NOT commit if user asked for "analysis only"
- ❌ Do NOT commit if no files were changed

**Rules:**
- Use clear, descriptive commit messages
- **Never push** unless explicitly asked

### Assumptions Rule

If a statement is not confirmed in code or documentation:
1. **Ask** a clarification question, OR
2. **Mark it explicitly** as `(Assumption: [detail])` in the documentation

Never treat assumed details as facts.

---

## Context Ladder

Read context in this order, stopping when you have enough:

| Level | What to Read | When |
|-------|--------------|------|
| **1. Always** | This file (`AI.md`) | Every session |
| **2. Recent** | `/updates/YYYY-MM.md` (current month) | Every session |
| **3. If coding** | `/docs/CODING-STANDARDS.md` | Before writing code |
| **4. If architecting** | `/docs/ARCHITECTURE.md` + `/docs/DECISIONS.md` | Before major changes |
| **5. If deep dive** | `/docs/PROJECT-CONTEXT.md` | When you need full understanding |
| **6. If feature-specific** | Feature docs (see below) | When working on that feature |

**Principle:** Load minimum context needed. Don't read everything unless required.

---

## Context Documents

Full reference of available context:

| Document | When to Read | Purpose |
|----------|--------------|---------|
| `/updates/YYYY-MM.md` | **Every session start** | Recent work, in-progress items |
| `/docs/PROJECT-CONTEXT.md` | Deep understanding needed | Business context, history, components |
| `/docs/ARCHITECTURE.md` | Building features, debugging | System design, integrations |
| `/docs/CODING-STANDARDS.md` | Writing/reviewing code | Style, patterns, conventions |
| `/docs/DECISIONS.md` | Before major changes | Past decisions & rationale |
| `/updates/MONTHLY-UPDATES-TEMPLATE.md` | Creating/updating monthly files | Template & invoicing rules |
| *Feature-specific docs* | When working on that feature | See table below |

### Feature-Specific Docs

*Add feature documentation as the project grows:*

| Document | Purpose |
|----------|--------|
| `[Feature guide].md` | [Feature-specific setup/usage] |

---

## Task Intake Checklist

Before starting significant work, confirm you understand:

| Item | Question |
|------|----------|
| **Goal** | What exactly should be achieved? |
| **Constraints** | Any limitations (time, tech, scope)? |
| **Files** | Which files will be affected? |
| **Tests** | How will success be verified? |
| **Risks** | What could go wrong? |
| **Definition of Done** | How do we know it's complete? |

For quick tasks, this can be implicit. For complex work, explicitly state your understanding before proceeding.

---

## Session Protocol

### Start
1. Read `/updates/YYYY-MM.md` for current month
2. Check `git status` for uncommitted changes
3. Note any in-progress items

### During Work
- Update monthly file as work completes
- Add decisions to `/docs/DECISIONS.md` if significant
- Commit after each meaningful change (see Commit Policy)

### End
- Verify all work documented in monthly update
- Stage and commit final changes
- Never push unless explicitly asked

---

## Monthly Updates Resolution

### Which File to Write
- **Always** identify the current calendar month
- **Write to** `YYYY-MM.md` for that month
- **Never** write new work to a past month unless explicitly about that period

### Bootstrap Context Creation
When introducing this system to an existing repo:
1. Check if `YYYY-MM.md` exists for current month — if not, create it
2. If no monthly files exist at all:
   - Create current month file
   - Also create previous month file
   - Use `git log --since="60 days ago"` to populate both with recent work

---

## Document Maintenance

**You are responsible for keeping project documentation current.** Update these files proactively:

| Document | Update When... |
|----------|----------------|
| `/updates/YYYY-MM.md` | After completing significant work |
| `/docs/PROJECT-CONTEXT.md` | New features, components, or integrations added |
| `/docs/ARCHITECTURE.md` | System design or tech stack changes |
| `/docs/DECISIONS.md` | Major technical/architectural decisions made |
| `/README.md` | Setup steps, commands, or project structure changes |

---

## Tool-Agnostic Usage Patterns

These prompts work with **any AI coding tool** (Windsurf, Cursor, Claude, Copilot, etc.):

### Session Start
```
Read @AI.md and @updates/YYYY-MM.md
```
*(Replace YYYY-MM with current month, e.g., 2025-01)*

### Before Writing Code
```
Read @docs/CODING-STANDARDS.md then implement [task]
```

### Before Major Changes
```
Read @docs/DECISIONS.md and @docs/ARCHITECTURE.md before proceeding
```

### Context Recovery
```
Read @AI.md and the last 2 monthly updates, then summarise what's in progress
```

### Deep Dive
```
Read @docs/PROJECT-CONTEXT.md for full project understanding
```

### Tool-Specific Notes

| Tool | Context Loading |
|------|----------------|
| **Windsurf** | Use `@filename` to reference files |
| **Cursor** | Use `@filename` or add to context with Cmd+Enter |
| **Claude** | Paste file contents or use Projects feature |
| **Copilot** | Reference files in chat with `#file:` |

---

**Context System Version:** 2.1  
**Last Updated:** [Current Date]
```

## Step 4: Create /docs/PROJECT-CONTEXT.md

Analyse the codebase and create a comprehensive context file:

```markdown
# Project Context

This document provides comprehensive context about the repository.

**Keep this document updated** as the project evolves.

---

## Project Identity

| | |
|---|---|
| **Name** | [From analysis] |
| **Repository** | [Repo name] |
| **Client/Owner** | [From analysis] |
| **Sector/Domain** | [From analysis] |
| **Platform** | [From analysis] |

---

## Business Context

[Describe what this project does and why it exists - 2-3 paragraphs]

---

## Repository Statistics

*Last analysed: [Date]*

| Component | Count | Notes |
|-----------|-------|-------|
| [Component type] | [Count] | [Notes] |

---

## Key Components

### [Category 1 - e.g., Controllers, Services, etc.]

| Component | Purpose |
|-----------|---------|
| [Name] | [Purpose] |

---

## Data Model

### Core Entities
- [Entity 1]: [Description]
- [Entity 2]: [Description]

### Key Relationships
- [Relationship description]

---

## Integrations

| System | Purpose | Data Flow | Auth Type | Owner | Status |
|--------|---------|-----------|-----------|-------|--------|
| [System] | [Purpose] | [Data in/out] | [Type] | [Team] | [Active/Planned] |

### Integration Notation Guide

| Marker | Meaning |
|--------|---------|
| `(confirmed)` | Verified in code, config, or by stakeholder |
| `(inferred)` | Deduced from code analysis but not confirmed |
| `(Assumption)` | Not verified — treat as uncertain |
| `TBD` | Unknown — needs investigation |

**Rules:**
- Use `TBD` or `(Assumption)` for unverified fields
- Never state assumed details as facts
- Update to `(confirmed)` once verified

---

## Historical Context

### [Month Year]
- [Key milestone or change]

---

## Known Constraints

1. [Constraint 1]
2. [Constraint 2]

---

**Last Updated:** [Date]
```

## Step 5: Create /docs/ARCHITECTURE.md

```markdown
# Architecture

Technical architecture and system design.

---

## System Overview

**Platform:** [Platform]
**Environment:** [Environment details]

---

## Tech Stack

| Layer | Technology |
|-------|------------|
| [Layer] | [Technology] |

---

## Project Structure

[Include folder structure with descriptions]

---

## Key Integrations

| Integration | Purpose | Status |
|-------------|---------|--------|
| [Integration] | [Purpose] | [Status] |

---

## Deployment

[Deployment commands and process]

---

**Last Updated:** [Date]
```

## Step 6: Create /docs/CODING-STANDARDS.md

Analyse the existing codebase for patterns and create standards:

```markdown
# Coding Standards

Follow these standards when generating or modifying code.

---

## General Rules

- **British English** spelling throughout
- **Follow existing patterns** in the codebase
- **Include all necessary imports**

---

## [Language/Framework] Standards

### Naming Conventions
| Element | Convention | Example |
|---------|------------|---------|
| [Element] | [Convention] | [Example] |

### Code Structure
[Best practices for this stack]

### Testing
[Testing conventions]

---

## Git Commit Messages

Format: `[Type]: Brief description`

Types: feat, fix, refactor, test, docs, chore

---

**Last Updated:** [Date]
```

## Step 7: Create /docs/DECISIONS.md

```markdown
# Decision Log

Key architectural and technical decisions. Add new decisions at the top.

---

## How to Use

Before major changes, check for relevant past decisions.

**Format:**
### [YYYY-MM-DD] Decision Title
**Context:** Why needed
**Decision:** What was decided
**Alternatives:** Other options considered
**Consequences:** Impact

---

## Decisions

### [Today's Date] AI Context System

**Context:** Needed tool-agnostic way to provide AI assistants with project context.

**Decision:** Implement modular documentation:
- `AI.md` as entry point
- `/docs/` for detailed context
- `/updates/` for monthly work tracking

**Alternatives:** Tool-specific memories (not portable), single large file (inefficient)

**Consequences:** Must tell AI "Read @AI.md" at session start; context is version-controlled.

---

**Last Updated:** [Date]
```

## Step 8: Create /updates/MONTHLY-UPDATES-TEMPLATE.md

[Copy the full template from an existing repo or create based on the comprehensive template]

## Step 9: Create Current Month's Update

Create `/updates/YYYY-MM.md` with:
- Basic structure from template
- Any recent work identified from git history
- In-progress items if applicable

## Step 10: Update README.md

Ensure README includes:
- Project purpose (updated if needed)
- Setup/installation steps
- Key commands
- Project structure (including new /docs/ and /updates/ folders)

## Step 11: Move Bootstrap to /docs/

Move `BOOTSTRAP.md` from repo root to `/docs/BOOTSTRAP.md` (keep for version tracking).

## Step 12: Verify Success Criteria

Confirm all items before proceeding:

- [ ] `AI.md` exists in repo root
- [ ] `/docs/PROJECT-CONTEXT.md` created with actual project analysis
- [ ] `/docs/ARCHITECTURE.md` created with tech stack details
- [ ] `/docs/CODING-STANDARDS.md` created with language-specific conventions
- [ ] `/docs/DECISIONS.md` created with initial decision logged
- [ ] `/docs/BOOTSTRAP.md` moved (not deleted)
- [ ] `/updates/MONTHLY-UPDATES-TEMPLATE.md` exists
- [ ] `/updates/YYYY-MM.md` created for current month
- [ ] `README.md` updated with AI context section

## Step 13: Commit

```bash
git add AI.md docs/ updates/ README.md
git commit -m "docs: Initialise AI context system v2.0"
```

## Step 14: Confirm

Summarise:
- Files created and their purposes
- Key components identified
- Any gaps or items needing manual review
- Confirm system is ready for use

---END PROMPT---
```

---

## What Gets Created

```
repository/
├── AI.md                           # Entry point (always read)
├── docs/
│   ├── PROJECT-CONTEXT.md          # Deep project understanding
│   ├── ARCHITECTURE.md             # System design
│   ├── CODING-STANDARDS.md         # Code conventions
│   └── DECISIONS.md                # Decision log
├── updates/
│   ├── MONTHLY-UPDATES-TEMPLATE.md # Template for monthly files
│   └── YYYY-MM.md                  # Current month's log
└── README.md                       # Updated with new structure
```

---

## After Initialisation

**Every session:**
```
Read @AI.md and @updates/YYYY-MM.md
```

**The AI will automatically:**
- Update monthly files after work
- Maintain PROJECT-CONTEXT.md as the repo evolves
- Log decisions in DECISIONS.md
- Keep README current

---

**Bootstrap Version:** 2.1  
**Created:** December 2025  
**Updated:** December 2025 — Added Commit Policy, Assumptions Rule, Monthly Updates Resolution, integration notation guide
