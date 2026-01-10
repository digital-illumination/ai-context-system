# Architecture

This document describes the technical architecture and system design for the Altia Intel Salesforce project.

---

## System Overview

**Platform:** Salesforce (Lightning Experience)  
**Environment:** Production  
**Org Type:** Sales Cloud

---

## Tech Stack

| Layer | Technology |
|-------|------------|
| **Backend** | Apex (Salesforce server-side) |
| **Frontend** | Lightning Web Components (LWC) |
| **Automation** | Flows (preferred), Process Builder (legacy — do not create new) |
| **Testing** | Apex Test Classes, Jest (LWC) |
| **Code Quality** | ESLint, Prettier |
| **Deployment** | SFDX CLI, Manifest-based |

---

## Project Structure

```
force-app/
├── main/
│   └── default/
│       ├── classes/          # Apex classes
│       ├── lwc/              # Lightning Web Components
│       ├── flows/            # Flow definitions
│       ├── objects/          # Custom objects & fields
│       ├── permissionsets/   # Permission sets
│       └── triggers/         # Apex triggers
```

---

## Key Integrations

| Integration | Purpose | Data Flow | Status |
|-------------|---------|-----------|--------|
| **Intacct** | Financial/accounting | Accounts with `IntacctId` → Intacct | Active |
| **Experience Cloud** | Community portal | Users ↔ Salesforce | Active |

---

## Data Model

<!-- Add key custom objects and relationships -->

### Core Objects
- Standard Salesforce objects (Account, Contact, Opportunity, etc.)
- Custom objects as needed for investigation software sales

---

## Key Feature Flows

### Data Quality Dashboard

```
User clicks Dashboard tab
    ↓
Lightning App Page loads `dataQualityDashboard` LWC
    ↓
LWC calls `DataQualityStatsController.getStats()` via @wire
    ↓
Apex runs SOQL queries against Lead, Contact, Account, Opportunity
    ↓
Stats returned to LWC → rendered in tabbed UI
```

**Files involved:**
- `force-app/.../lwc/dataQualityDashboard/`
- `force-app/.../classes/DataQualityStatsController.cls`

### AI Enrichment (Planned)

```
Account created/updated
    ↓
Flow/Trigger fires (TBD)
    ↓
External AI service called
    ↓
AI fields populated on Account
```

**Files involved:**
- See `/AI_INSIGHTS_DEPLOYMENT_GUIDE.md`
- See `/Account_AI_Fields_Summary.md`

---

## Execution Paths

Common request flows through the system:

| Scenario | Path |
|----------|------|
| **View data quality** | UI → LWC (`dataQualityDashboard`) → Apex (`DataQualityStatsController`) → SOQL → Data |
| **Send email from Flow** | Flow → `InvocableSendEmail` → Messaging.SingleEmailMessage → Delivered |
| **Community login** | Experience Cloud → `CommunitiesLoginController` → Auth → Session |
| **Record update** | UI → Standard/Custom Save → Triggers → Flows → Validation Rules → Commit |

---

## Security Model

- Permission Sets for feature access
- Field-Level Security on sensitive fields
- Sharing Rules as configured in org

---

## Deployment Architecture

### Environments
| Environment | Purpose | Org Alias |
|-------------|---------|-----------|
| UAT Edu | User Acceptance Testing | `uat-edu` |
| Production | Live environment | *TBC* |

### Deployment Command
```bash
sf project deploy start -x manifest/package.xml -o <target-org>
```

---

## Automation Strategy

| Type | Status | Guidance |
|------|--------|----------|
| **Flows** | ✅ Preferred | Use for all new automation |
| **Process Builder** | ⚠️ Legacy | Do NOT create new; migrate when touching existing |
| **Workflow Rules** | ⚠️ Legacy | Do NOT create new |
| **Apex Triggers** | ✅ Use when needed | For complex logic Flows can't handle |

**Note:** Salesforce is retiring Process Builder. All new automation should use Flows.

---

**Last Updated:** December 2025
