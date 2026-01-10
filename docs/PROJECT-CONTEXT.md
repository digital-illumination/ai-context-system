# Project Context

This document provides comprehensive context about the repository. Read this when you need deep understanding of the project's purpose, history, and current state.

**Keep this document updated** as the project evolves.

---

## Project Identity

| | |
|---|---|
| **Name** | Altia Intel Salesforce |
| **Repository** | altia-intel-salesforce |
| **Client** | Altia Intel |
| **Sector** | Investigation Software Solutions |
| **Platform** | Salesforce (Lightning Experience) |
| **API Version** | 64.0 |

---

## Business Context

Altia Intel provides investigation software solutions that empower organisations to make the world a safer place. Their product suite includes Financial Investigator, Insight Case Management, OSINTInvestigator, and Altia HQ — serving law enforcement, financial crime investigators, and operational teams. The Salesforce org serves as their CRM for:

- **Lead Management** — Tracking prospective clients (government agencies, law enforcement, financial institutions)
- **Account Management** — Managing client accounts and relationships
- **Contact Management** — Decision-makers and stakeholders at client organisations
- **Opportunity Tracking** — Sales pipeline for investigation software solutions

---

## Non-Goals / Out of Scope

Do **NOT** pursue these without explicit approval:

- **Broad refactoring** — Don't restructure existing working code unless specifically asked
- **Schema changes** — Don't add/remove custom objects or fields without discussion
- **Flow modifications** — 137 flows exist; don't modify unless that's the specific task
- **Permission changes** — Don't modify permission sets or profiles
- **Production deployments** — Never deploy to production; sandbox only
- **Data deletion** — Never delete records; only flag or report
- **Third-party integrations** — Don't add new external dependencies

---

## Current Initiatives

### Phase 1: Data Quality & Pruning (Active)
Cleaning up data quality issues across Leads, Contacts, Accounts, and Opportunities. Includes:
- Identifying inactive records (12+ months)
- Finding placeholder/dummy data
- Detecting orphaned records
- Flagging bounced emails
- Duplicate detection

**Key Components:**
- `DataQualityStatsController.cls` — Statistics engine
- `dataQualityDashboard` LWC — Visual dashboard
- 8 pre-built reports for stakeholder review

### AI-Powered Enrichment (Planned/Partial)
Account enrichment using AI. See:
- `/AI_INSIGHTS_DEPLOYMENT_GUIDE.md`
- `/Account_AI_Fields_Summary.md`

---

## Feature Map (Top 10 Key Components)

Quick reference for the most important components:

| # | Component | Type | Purpose | File/Location |
|---|-----------|------|---------|---------------|
| 1 | `DataQualityStatsController` | Apex | Statistics engine for data pruning | `/force-app/.../classes/` |
| 2 | `dataQualityDashboard` | LWC | Visual dashboard for data quality | `/force-app/.../lwc/` |
| 3 | `InvocableSendEmail` | Apex | Flow-callable email utility | `/force-app/.../classes/` |
| 4 | Account AI Fields | Config | AI enrichment fields on Account | See `/Account_AI_Fields_Summary.md` |
| 5 | Data Quality Reports | Reports | 8 reports for pruning review | `/force-app/.../reports/` |
| 6 | Communities Controllers | Apex | Login/registration for Experience Cloud | `/force-app/.../classes/` |
| 7 | *TBD* | | | |
| 8 | *TBD* | | | |
| 9 | *TBD* | | | |
| 10 | *TBD* | | | |

*Update this list as key components are identified or built.*

---

## Repository Statistics

*Note: These counts are approximate and may drift. Re-run analysis if accuracy is critical.*

| Component | Approx Count | Notes |
|-----------|--------------|-------|
| **Apex Classes** | ~25 | Includes controllers, tests |
| **LWC Components** | 1 | `dataQualityDashboard` |
| **Aura Components** | ~35 | Legacy components |
| **Flows** | ~137 | Automation workflows |
| **Custom Objects** | ~675 | Extensive data model |
| **Permission Sets** | ~68 | Access control |
| **Reports** | ~9 | Including Data Quality reports |
| **Layouts** | ~163 | Page layouts |

---

## Key Custom Components

### Apex Classes (Custom)

| Class | Purpose |
|-------|---------|
| `DataQualityStatsController` | Data quality statistics for pruning initiative |
| `InvocableSendEmail` | Flow-invocable email sending |

*Note: Many classes are Salesforce-generated (Communities, Login controllers)*

### Lightning Web Components

| Component | Purpose |
|-----------|---------|
| `dataQualityDashboard` | Tabbed dashboard showing data quality stats by object |

### Triggers

| Trigger | Object | Purpose |
|---------|--------|---------|
| *To be documented* | | |

---

## Data Model Highlights

### Core Objects
- **Account** — Client organisations (government, law enforcement, financial institutions)
- **Contact** — Decision-makers and stakeholders
- **Lead** — Prospective clients
- **Opportunity** — Sales pipeline

### Custom Fields of Note
- AI Insights fields on Account (see `/Account_AI_Fields_Summary.md`)
- Data quality indicator fields (if added)

### Key Relationships
- Contacts → Accounts (standard lookup)
- Opportunities → Accounts (standard lookup)
- *Document additional custom relationships as discovered*

---

## Integrations

| System | Purpose | Data Flow | Auth Type | Owner | Status |
|--------|---------|-----------|-----------|-------|--------|
| **Intacct** | Financial/accounting sync | Accounts with `IntacctId` → Intacct | API Key *(Assumption: standard Intacct auth)* | Finance team *(Assumption: owns financial systems)* | Active |
| **Experience Cloud** | Community portal | Users ↔ Salesforce | OAuth/SAML *(inferred)* | Altia Intel IT *(Assumption: IT owns community)* | Active *(inferred from controllers)* |

### Integration Notation Guide

Use these markers when documenting integrations:

| Marker | Meaning | Example |
|--------|---------|---------|
| `(confirmed)` | Verified in code, config, or by stakeholder | `API Key (confirmed)` |
| `(inferred)` | Deduced from code analysis but not confirmed | `OAuth (inferred)` |
| `(Assumption: [detail])` | Not verified — include reasoning | `Finance team (Assumption: owns financial systems)` |
| `TBD` | Unknown — needs investigation | `Auth Type: TBD` |

**Rules:**
- If a field cannot be verified, use `TBD` or mark as `(Assumption)`
- Never state assumed details as facts
- Update markers to `(confirmed)` once verified

**Integration Rules:**
- Records with `IntacctId` are synced externally — don't delete or significantly modify
- Check with Finance before bulk changes to Accounts

---

## Environment Details

### Sandboxes
| Name | Alias | Purpose |
|------|-------|---------|
| UAT Edu | `uat-edu` | User Acceptance Testing |

### Production
- *Details TBD*

### Authentication
```bash
sf org login web --alias AltiaProduction --instance-url https://login.salesforce.com
```

---

## Historical Context

### October 2025
- Initial AI Insights implementation
- Account AI field configurations

### November 2025
- Continued AI features development
- Account field refinements

### December 2025
- Project governance established (Git, monthly updates)
- Data Quality initiative launched
- Built DataQualityStatsController, dashboard, reports

---

## Business Rules & Domain Constraints

Critical rules that must be respected:

| Rule | Description | Enforcement |
|------|-------------|-------------|
| **Key Contact Protection** | Contacts who are primary decision-makers must not be deleted even if inactive | Manual review required |
| **IntacctId Linkage** | Accounts with `IntacctId` field populated sync to Intacct financial system | Don't delete; check before bulk updates |
| **No Bulk Deletes** | Use staged deletion: flag → review → archive → delete | Always flag first |
| **Data Retention** | Investigation sector may have compliance requirements | Consult before purging |

---

## Known Constraints & Considerations

1. **Large Metadata Volume** — ~675 objects, ~137 flows; changes may have wide impact
2. **Community Users** — Multiple community-related controllers suggest Experience Cloud usage
3. **Governor Limits** — Bulk operations must respect Salesforce limits
4. **Mixed Sharing Model** — Check `with sharing` requirements before new Apex

---

## Document Maintenance

**This file should be updated when:**
- New features or components are added
- Integrations are configured
- Major architectural decisions are made
- Project initiatives change status

**Who updates:** AI assistant proactively, or manually during reviews

---

**Last Updated:** December 2025  
**Next Review:** When significant changes occur
