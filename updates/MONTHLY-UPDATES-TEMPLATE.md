# Monthly Updates System - Setup Guide v2.0

A comprehensive system for tracking work, decisions, and invoiceable items across repositories using AI assistants (works with any tool: Windsurf, Cursor, Claude, Copilot, etc.).

---

## 🚀 Quick Start

1. Copy the **Setup Prompt** into a new AI coding session (any tool)
2. The AI will create the folder structure and first monthly file
3. Use **Session Start Prompt** at the beginning of each work session
4. Use **End of Month Checklist** to finalise each month

---

## 📋 Setup Prompt

Copy everything between the `---BEGIN PROMPT---` and `---END PROMPT---` markers:

```
---BEGIN PROMPT---

# Role & Persona

You are a meticulous project documentarian and senior engineer assistant. Your responsibilities include:

1. **Tracking all work** performed in this repository with precision
2. **Capturing decisions** made during our conversations, including rationale and alternatives considered
3. **Generating invoiceable summaries** that accurately reflect effort (targeting ~3 days/month, usually slightly over)
4. **Proactively updating** the monthly update file without being asked when significant work is completed
5. **Maintaining context** across sessions through well-structured documentation

You write in British English and produce professional, concise documentation suitable for client reporting.

---

# Task: Set Up Monthly Updates System

Please set up a monthly work logging system in this repository:

## Step 1: Create Folder Structure

Create an `/updates/` folder in the repository root.

## Step 2: Create Monthly Update File

Create a file named `YYYY-MM.md` (e.g., `2025-01.md`) for the current month using this exact structure:

---BEGIN TEMPLATE---

# [Project Name] - [Month Year] Update

**[Company/Project]** - [Brief Description]  
**Period:** [Month Year]

---

## 📋 Executive Summary

[2-3 sentences summarizing what was accomplished this month]

### Key Deliverables

| Task | Description | Status |
|------|-------------|--------|
| [Task 1] | [Brief description] | ✅ Complete / 🔄 In Progress / ⏳ Pending |

---

## 🎯 Detailed Work

### 1. [Feature/Task Name]

**Context:** [Why this was needed]

**What was done:**
- [Key point 1]
- [Key point 2]

**Technical Details:**
- [Implementation detail]

**Files Changed:**
- [List of key files modified]

---

## 💬 Key Decisions & Discussions

### Architecture Decisions
- **[Decision name]**: [What was decided and why]

### Design Choices
- **[Choice name]**: [What was chosen and alternatives considered]

### Technical Decisions
- **[Decision name]**: [Technical choice and rationale]

---

## 🔧 Technical Notes

[Any technical context, gotchas, or implementation notes worth preserving]

---

## ✅ Status

[Current status summary]

---

## 🚧 Current Work / Next Session

*Update this section at the end of each session to enable fast context recovery*

**In Progress:**
- [Task currently being worked on]

**Next Steps:**
- [What should be done next session]

**Blockers:**
- [Any issues preventing progress] or None

---

## 💷 Invoiceable Items

| Qty | Details |
|-----|---------|
| [X Days] | [Concise description starting with action verb, describing outcome/benefit] |

**Estimated Total: [X Days]**

*Target: ~3 days/month (usually slightly over), 3-5 line items*

---

**Document Created:** [Date]  
**Author:** AI-assisted  
**For:** [Team/Company]

---END TEMPLATE---

## Step 3: Review Existing Work

Scan the repository for any recent work and add it to the current month's update if applicable.

---END PROMPT---
```

---

## 🔄 Session Start Prompt

Use this at the **beginning of each work session**:

```
---BEGIN PROMPT---

Before we begin this session:

1. **Check Monthly Update File**
   - Verify `/updates/YYYY-MM.md` exists for current month
   - If not, create it using the standard template
   - If month has changed, create new file and finalise previous month

2. **Review Context**
   - Read the current month's update file to understand recent work
   - Note any in-progress items from previous sessions

3. **Session Tracking**
   - You will proactively update the monthly file as we complete work
   - Capture any key decisions we make during this session
   - Add technical notes for anything non-obvious

4. **Confirm Ready**
   - Briefly confirm you've reviewed the context
   - Note any in-progress items that may need continuation

---END PROMPT---
```

---

## 🔧 End of Session Prompt

Use this at the **end of significant work sessions**:

```
---BEGIN PROMPT---

Please finalise this session:

1. **Update Monthly File** with:
   - All work completed in this session
   - Any key decisions we made (with rationale)
   - Technical choices and their reasoning
   - Any issues encountered and how they were resolved

2. **Update Invoiceable Items**
   - Add/update line items for today's work
   - Ensure descriptions are outcome-focused
   - Verify running total is reasonable (~3 days/month target)

3. **Note Any Pending Work**
   - Mark any incomplete items as 🔄 In Progress
   - Add notes about next steps for continuation

4. **Verify Nothing Missed**
   - Review our conversation for any undocumented decisions
   - Check for any technical notes worth preserving

---END PROMPT---
```

---

## 📅 End of Month Checklist

Use this to **finalise each month** (copy as prompt):

```
---BEGIN PROMPT---

Please complete the end-of-month process for `/updates/YYYY-MM.md`:

## Checklist

- [ ] **All work documented** - Review git commits/changes for the month
- [ ] **Decisions captured** - Check conversation history for key decisions
- [ ] **Technical notes complete** - Any gotchas or implementation details
- [ ] **Status updated** - Mark all items as ✅ Complete, 🔄 In Progress, or ⏳ Pending
- [ ] **Invoiceable items finalised** - Consolidated to 3-5 line items, ~3 days total
- [ ] **Invoice descriptions polished** - Action verbs, outcomes, British English
- [ ] **Carry forward pending items** - Note any work continuing to next month

## Create Next Month

Create `/updates/YYYY-MM.md` for the upcoming month with:
- Any carried-forward in-progress items
- Known upcoming work if discussed

## Summary

Provide a brief summary of:
- Total days invoiceable this month
- Key accomplishments
- Any items carrying forward

---END PROMPT---
```

---

## 🔄 Context Recovery Prompt

Use this when **context is lost** mid-project (new session, memory issues, etc.):

```
---BEGIN PROMPT---

I need to recover context for this project. Please:

1. **Read Recent Updates**
   - Read `/updates/YYYY-MM.md` for current month
   - Read previous month if current is sparse
   - Identify any in-progress work

2. **Scan Repository**
   - Check recent file modifications
   - Look for TODO comments or WIP markers
   - Review any README or docs for project context

3. **Reconstruct Context**
   - Summarise what you understand about:
     - Project purpose and tech stack
     - Recent work completed
     - Work in progress
     - Key decisions made
   - Ask clarifying questions if critical information is missing

4. **Confirm Understanding**
   - State what you believe the current focus should be
   - I'll confirm or correct before we proceed

---END PROMPT---
```

---

## 🧠 Working with Windsurf Memory & Context

### How Windsurf Memory Works

Windsurf/Cascade uses two types of context:

1. **Session Context** - Conversation history within current session (temporary)
2. **Persistent Memory** - Saved memories that persist across sessions (permanent)

### Best Practices for Memory

**Creating Effective Memories:**
```
Create a memory with:
- **Title:** [Descriptive title for easy retrieval]
- **Content:** [Structured information with clear sections]
- **Tags:** [Relevant keywords for retrieval]
```

**Memory Update Prompt:**
```
---BEGIN PROMPT---

Please update the memory titled "[Memory Title]" with the following changes:
- [Change 1]
- [Change 2]

If the memory doesn't exist, create it with this content:
[Full memory content]

---END PROMPT---
```

**Memory Retrieval Check:**
```
---BEGIN PROMPT---

What memories do you have for this repository/project? 
Please list them and summarise their contents.

---END PROMPT---
```

### Recommended Memories to Create

| Memory Title | Purpose | When to Update |
|--------------|---------|----------------|
| Monthly Updates System | Folder location, format, invoicing rules | Rarely (setup only) |
| Project Context | Tech stack, integrations, key systems | When architecture changes |
| Coding Standards | Naming conventions, patterns used | When standards evolve |
| Client Preferences | Communication style, terminology | When preferences change |

### Context Maximisation Tips

1. **Start sessions with context retrieval** - Use Session Start Prompt
2. **Reference files explicitly** - Use `@filename` to pull file content into context
3. **Keep monthly updates current** - They serve as retrievable context
4. **Use the `/updates/` folder** - Windsurf can read these to reconstruct context
5. **Create memories for stable information** - Don't rely on session context for important rules

### Refreshing Stale Memory

If memory seems outdated:

```
---BEGIN PROMPT---

Please review and update the memory titled "[Memory Title]":

1. Read the current memory content
2. Check if it matches current project state
3. Update any outdated information
4. Add any missing critical details
5. Confirm the update was made

Current state that should be reflected:
- [Current fact 1]
- [Current fact 2]

---END PROMPT---
```

---

## ⚙️ Constraints & Rules

These rules ensure consistency across all monthly updates:

### Documentation Rules
- Use **British English** spelling throughout
- Keep descriptions **concise but complete**
- Include **rationale** for decisions, not just outcomes
- Reference **specific files** when discussing changes

### Invoicing Rules
- Target **~3 days/month** (usually slightly over)
- Consolidate into **3-5 line items** maximum
- Start each item with **action verb** (Built, Created, Fixed, etc.)
- Focus on **outcomes and benefits**, not activities
- Use **0.25/0.5/0.75/1/1.5 day** increments

### Proactive Behaviour
- **DO** update the monthly file after completing significant work
- **DO** capture decisions as they're made in conversation
- **DO** add technical notes for non-obvious implementations
- **DON'T** wait to be asked to update documentation
- **DON'T** let sessions end with undocumented work

### Time Estimation Guide

| Duration | Typical Work |
|----------|--------------|
| 0.25 Days (~2 hrs) | Quick fixes, config changes, small bug fixes |
| 0.5 Days (~4 hrs) | Medium features, single integrations, API connections |
| 0.75 Days (~6 hrs) | Larger features, multi-step implementations |
| 1 Day (~8 hrs) | Full features, complex workflows |
| 1.5 Days (~12 hrs) | Major features, multi-system integrations |

---

## 📁 Example File Structure

```
repository/
├── updates/
│   ├── MONTHLY-UPDATES-TEMPLATE.md  # This guide
│   ├── 2025-10.md                   # October 2025
│   ├── 2025-11.md                   # November 2025
│   ├── 2025-12.md                   # December 2025
│   └── [supporting-docs].md         # Technical reference docs
├── src/
├── docs/
└── ...
```

---

## 📊 Example Invoice Items

**Good Examples:**

| Qty | Details |
|-----|---------|
| 1.5 Days | Built Lead Enrichment workflow with Salesforce triggers, Google Custom Search integration for company context, and GPT-4o-mini enrichment generating company profiles, confidence scores, and next-step suggestions. |
| 1 Day | Added Activity Scoring system with dual-timeframe analysis (all-time and 90-day summaries), composite scoring formula, and health indicators using two-stage LLM approach. |
| 0.5 Days | Fixed activity data collection to use Task resource with TaskSubtype filtering, including smart sampling for high-volume opportunities to prevent token overflow. |
| 0.75 Days | Created comprehensive documentation including testing guide, privacy compliance documentation, and API setup guide. |

**Avoid:**
- ❌ "Did some work on the API" (too vague)
- ❌ "Spent time debugging" (not outcome-focused)
- ❌ "Various improvements" (not specific)
- ❌ "Worked on project" (no deliverable)

---

## 🔍 Quick Reference

| Situation | Action |
|-----------|--------|
| Starting new repo | Use **Setup Prompt** |
| Beginning work session | Use **Session Start Prompt** |
| Completed significant work | AI updates automatically (proactive) |
| Ending work session | Use **End of Session Prompt** |
| End of month | Use **End of Month Checklist** |
| Lost context | Use **Context Recovery Prompt** |
| Memory seems wrong | Use **Memory Update Prompt** |

---

**Template Version:** 2.0  
**Created:** December 2025  
**Major Update:** Added persona, constraints, proactive rules, memory guidance  
**Source:** Altia Intel n8n repository
