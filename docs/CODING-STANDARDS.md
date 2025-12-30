# Coding Standards

Follow these standards when generating or modifying code in this repository.

---

## General Rules

- **British English** spelling throughout (colour, organisation, behaviour)
- **Maximum 80 characters** per line where practical
- **Follow existing patterns** in the codebase
- **Include all necessary imports** at the top of files

---

## Data Classification & Redaction

**Never expose or hardcode these in code, logs, or outputs:**

| Data Type | Examples | Handling |
|-----------|----------|----------|
| **PII** | Email, phone, address, name | Mask in logs; don't include in error messages |
| **Credentials** | API keys, passwords, tokens | Use Named Credentials or Custom Metadata |
| **Org IDs** | `00D...`, `005...` (User IDs) | Don't expose in client-side code |
| **Client Data** | Account names, opportunity values | Don't include in debug logs for production |
| **Session IDs** | `sid=...` | Never log or expose |

**Rules:**
- Use `System.debug(LoggingLevel.DEBUG, ...)` not `.INFO` for sensitive data
- In production, ensure debug logs are disabled or filtered
- Never commit credentials to Git; use `.gitignore` and environment variables

---

## Apex Standards

### Naming Conventions
| Element | Convention | Example |
|---------|------------|---------|
| Classes | PascalCase | `AccountService` |
| Methods | camelCase | `getAccountById()` |
| Variables | camelCase | `accountList` |
| Constants | UPPER_SNAKE | `MAX_RETRY_COUNT` |
| Test Classes | ClassNameTest | `AccountServiceTest` |

### Code Structure
```apex
public with sharing class ExampleService {
    
    // Constants first
    private static final Integer MAX_RECORDS = 200;
    
    // Public methods
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        try {
            return [SELECT Id, Name FROM Account LIMIT :MAX_RECORDS];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    // Private helper methods at bottom
    private static void helperMethod() {
        // Implementation
    }
}
```

### Bulkification Rules
- **Never** put SOQL queries inside loops
- **Never** put DML operations inside loops
- **Always** use collections (List, Set, Map) for bulk processing
- **Use** `Database.insert(records, false)` for partial success handling

### Error Handling

**For LWC-callable methods (UI context):**
```apex
try {
    // Operation
} catch (DmlException e) {
    throw new AuraHandledException('Save failed: ' + e.getMessage());
} catch (Exception e) {
    throw new AuraHandledException('Unexpected error: ' + e.getMessage());
}
```

**For API/Integration context:**
```apex
try {
    // Operation
} catch (Exception e) {
    // Log full details server-side
    System.debug(LoggingLevel.ERROR, 'Error: ' + e.getMessage() + ' Stack: ' + e.getStackTraceString());
    // Return sanitised error to caller
    throw new CustomException('Operation failed. See logs for details.');
}
```

### Testing Requirements
- **Minimum 75%** code coverage (aim for 90%+)
- **Test both positive and negative** scenarios
- **Use `@TestSetup`** for common test data
- **Never** use `@SeeAllData=true` unless absolutely necessary

```apex
@isTest
private class ExampleServiceTest {
    
    @TestSetup
    static void setupTestData() {
        // Create test records
    }
    
    @isTest
    static void testGetAccounts_Success() {
        // Arrange
        // Act
        Test.startTest();
        List<Account> results = ExampleService.getAccounts();
        Test.stopTest();
        // Assert
        System.assertNotEquals(null, results, 'Results should not be null');
    }
    
    @isTest
    static void testGetAccounts_NoData() {
        // Test empty scenario
    }
}
```

---

## Lightning Web Components (LWC)

### File Structure
```
lwc/
└── exampleComponent/
    ├── exampleComponent.html
    ├── exampleComponent.js
    ├── exampleComponent.css
    └── exampleComponent.js-meta.xml
```

### JavaScript Style
- Use **camelCase** for variables and methods
- Use **PascalCase** for class names
- **Avoid** inline styles; use CSS file
- **Import** wire adapters and Apex methods at top

```javascript
import { LightningElement, wire, api } from 'lwc';
import getAccounts from '@salesforce/apex/AccountService.getAccounts';

export default class ExampleComponent extends LightningElement {
    @api recordId;
    accounts = [];
    error;

    @wire(getAccounts)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.accounts = [];
        }
    }
}
```

### HTML Templates
- Use **kebab-case** for custom attributes
- Use **SLDS classes** for styling
- Keep templates **readable** with proper indentation

### LWC Testing (Jest)

**Run tests:**
```bash
npm run test:unit           # Run all LWC tests
npm run test:unit:watch     # Watch mode
npm run test:unit:coverage  # With coverage report
```

**Test structure:**
```javascript
import { createElement } from 'lwc';
import ExampleComponent from 'c/exampleComponent';

describe('c-example-component', () => {
    afterEach(() => {
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('renders correctly', () => {
        const element = createElement('c-example-component', {
            is: ExampleComponent
        });
        document.body.appendChild(element);
        
        const heading = element.shadowRoot.querySelector('h1');
        expect(heading.textContent).toBe('Expected Text');
    });
});
```

---

## Flows

- **Naming:** `[Object]_[Trigger/Action]_[Purpose]`
  - Example: `Account_AfterInsert_EnrichData`
- **Add descriptions** to all Flow elements
- **Use fault paths** for error handling
- **Bulkify** by avoiding loops where possible

---

## XML Metadata

- Keep elements **alphabetically ordered** where possible
- Use **consistent indentation** (4 spaces)
- Include **descriptions** for custom fields and objects

---

## Git Commit Messages

Format: `[Type]: Brief description`

Types:
- `feat:` New feature
- `fix:` Bug fix
- `refactor:` Code refactoring
- `test:` Adding/updating tests
- `docs:` Documentation changes
- `chore:` Maintenance tasks

Examples:
```
feat: Add AI insights field to Account object
fix: Resolve null pointer in AccountService.getAccounts
refactor: Extract common validation logic to utility class
```

---

## Salesforce-Specific Pitfalls

Common mistakes to avoid:

| Pitfall | Problem | Solution |
|---------|---------|----------|
| **SOQL in loops** | Governor limit exceeded | Query before loop, use Maps |
| **DML in loops** | Governor limit exceeded | Collect records, DML after loop |
| **Missing `with sharing`** | Security bypass | Always use `with sharing` unless justified |
| **CRUD/FLS not enforced** | Security vulnerability | Use `WITH SECURITY_ENFORCED` or `Security.stripInaccessible()` |
| **Mixed DML** | `MIXED_DML_OPERATION` error | Separate setup objects from regular DML; use `@future` if needed |
| **Hardcoded IDs** | Breaks across orgs | Use Custom Metadata or Custom Settings |
| **No null checks** | `NullPointerException` | Always check for null before accessing |
| **Trigger recursion** | Infinite loops | Use static Boolean to prevent re-entry |
| **CPU timeout** | Complex logic in triggers | Move to async (`@future`, Queueable) |
| **@SeeAllData=true** | Tests depend on org data | Create test data in tests |

### Governor Limits Quick Reference

| Limit | Synchronous | Asynchronous |
|-------|------------|---------------|
| SOQL queries | 100 | 200 |
| SOQL rows | 50,000 | 50,000 |
| DML statements | 150 | 150 |
| DML rows | 10,000 | 10,000 |
| CPU time | 10,000ms | 60,000ms |
| Heap size | 6MB | 12MB |

---

**Last Updated:** December 2025
