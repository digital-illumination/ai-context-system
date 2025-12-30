# Decision Log

This document records key architectural and technical decisions made on this project. Add new decisions at the top.

---

## How to Use This Log

Before making significant changes, check if a relevant decision already exists. If you're about to re-debate something, the rationale here should explain why the current approach was chosen.

**Format for new entries:**
```markdown
### [YYYY-MM-DD] Decision Title

**Status:** ✅ Active | ⚠️ Superseded by [link] | ❌ Deprecated
**Context:** Why this decision was needed
**Decision:** What was decided
**Alternatives Considered:** Other options and why they were rejected
**Consequences:** Impact of this decision
**Code Links:** Files/components implementing this decision
```

**Status values:**
- ✅ **Active** — Currently in effect; follow this guidance
- ⚠️ **Superseded** — Replaced by a newer decision (link to it)
- ❌ **Deprecated** — No longer relevant but kept for history

---

## Decisions

<!-- Add new decisions below this line, newest first -->

### [2025-12-30] AI Context Documentation Structure v2.0

**Status:** ✅ Active

**Context:** Needed a tool-agnostic way to provide AI assistants with project context that survives machine changes and works with any code generation tool.

**Decision:** Implement modular documentation structure:
- `AI.md` as lightweight entry point (always read)
- `/docs/` folder for detailed context (read as needed)
- `/updates/` folder for monthly work tracking (read for recent context)
- Context ladder for efficient loading
- Safe defaults to prevent destructive actions

**Alternatives Considered:**
- Windsurf Memories: Tool-specific, lost on machine change
- Single large AI.md: Too much context loaded always
- No documentation: AI loses context between sessions

**Consequences:**
- AI must be told "Read @AI.md" at session start
- Context is version-controlled and portable
- Works with any AI tool (Windsurf, Cursor, Claude, etc.)

**Code Links:**
- `/AI.md` — Entry point
- `/docs/PROJECT-CONTEXT.md` — Deep context
- `/docs/ARCHITECTURE.md` — System design
- `/docs/CODING-STANDARDS.md` — Conventions
- `/docs/BOOTSTRAP.md` — New repo setup

---

### [2025-12-21] Monthly Updates System

**Status:** ✅ Active

**Context:** Need to track work for invoicing and maintain context across sessions.

**Decision:** Use `/updates/YYYY-MM.md` files with standardised template including:
- Executive summary
- Detailed work sections
- Key decisions
- Invoiceable items (~3 days/month target)

**Alternatives Considered:**
- Time tracking tools: External to codebase, not AI-readable
- Git commits only: Lacks decision rationale and invoicing detail

**Consequences:**
- AI can read recent work context from update files
- Invoicing is streamlined with pre-formatted entries
- Decisions are captured for future reference

**Code Links:**
- `/updates/MONTHLY-UPDATES-TEMPLATE.md` — Template and guide
- `/updates/2025-12.md` — Current month example

---

**Last Updated:** December 2025
