# AI Assistant Context

**Read this file at session start.** It tells you how to work on this project and where to find detailed context.

---

## Project Summary

| | |
|---|---|
| **Project** | VenturEd Solutions Salesforce |
| **Client** | VenturEd Solutions (Education sector) |
| **Environment** | Salesforce Sandbox (UAT Edu) |
| **Stack** | Apex, LWC, Flows, SFDX |

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
- ✅ After each meaningful change made as part of a user request (small, regular commits)
- ✅ After code or configuration edits when the task is complete
- ✅ After documentation updates
- ❌ Do NOT commit if user asked for "analysis only" or "no changes"
- ❌ Do NOT commit if no files were changed

**Commit rules:**
- Use clear, descriptive commit messages (what and why)
- **Never push** unless explicitly asked
- Commit little and often — don't let changes accumulate

### Assumptions Rule

If a statement is not confirmed in code or documentation:
1. **Ask** a clarification question, OR
2. **Mark it explicitly** as `(Assumption: [detail])` in the documentation

**Never treat assumed details as facts.** Examples:
- Auth types → ask or mark `(Assumption: API Key)`
- Integration ownership → ask or mark `(Assumption: Finance team)`
- Data flows → verify in code or mark `(inferred)`

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

### Feature-Specific Docs
| Document | Purpose |
|----------|---------|
| `/AI_INSIGHTS_DEPLOYMENT_GUIDE.md` | AI features setup |
| `/Account_AI_Fields_Summary.md` | Account field configurations |
| `/DATA_QUALITY_GUIDE.md` | Data quality tooling |

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
- **Write to** `YYYY-MM.md` for that month (e.g., `2025-01.md` for January 2025)
- **Never** write new work to a past month unless the task explicitly relates to that period

### Bootstrap Context Creation

When introducing this system to an existing repo:

1. Check if `YYYY-MM.md` exists for the **current month**
   - If not, create it from template
2. If **no monthly files exist at all**:
   - Create current month file
   - Also create **previous month** file
   - Use `git log --since="60 days ago" --oneline` to scan recent work
   - Summarise work from the last ~45–60 days into both files
3. Populate with actual work done (not placeholders)

### Checklist

- [ ] Current month file exists (`/updates/YYYY-MM.md`)
- [ ] Previous month file exists (if system newly introduced)
- [ ] Recent git history reflected in monthly files
- [ ] In-progress items noted in "Current Work" section

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

**Rules:**
- Don't wait to be asked — update proactively
- Keep updates concise and factual
- If you add a new component, document it in PROJECT-CONTEXT.md
- If you make a significant decision, log it in DECISIONS.md

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

## Repo Initialisation (First-Time Setup)

**For new repositories:** Copy `/docs/BOOTSTRAP.md` to the new repo and run:

```
Read @BOOTSTRAP.md and execute the initialisation process for this repository.
```

The bootstrap file contains the complete initialisation prompt that will:
1. Analyse the codebase
2. Create all context documents
3. Set up the monthly updates system
4. Update README

---

**Context System Version:** 2.1  
**Last Updated:** December 2025
