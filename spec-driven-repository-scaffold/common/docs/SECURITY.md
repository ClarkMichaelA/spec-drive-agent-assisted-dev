# Security and Privacy Design

Status: Draft  
Owner: `[SECURITY OR TECHNICAL OWNER]`  
Last reviewed: `[YYYY-MM-DD]`

## How to use this file

Describe the system's real security and privacy needs in plain language, then connect them to testable requirements and controls. Do not paste secrets or sensitive infrastructure details that do not belong in the repository.

## 1. Security objectives

- `[OBJECTIVE, SUCH AS PREVENT UNAUTHORIZED ACCESS TO A DATA TYPE]`
- `[OBJECTIVE]`

## 2. Assets and data classification

| Asset or data | Owner | Classification | Where stored or processed | Main concern |
|---|---|---|---|---|
| `[ASSET]` | `[OWNER]` | `[CLASSIFICATION]` | `[LOCATION/COMPONENT]` | `[CONFIDENTIALITY, INTEGRITY, AVAILABILITY, PRIVACY]` |

## 3. Actors and access levels

| Actor | Allowed actions | Prohibited actions | Authentication source |
|---|---|---|---|
| `[ACTOR]` | `[ACTIONS]` | `[ACTIONS]` | `[SOURCE]` |

## 4. Trust boundaries and entry points

- `[BOUNDARY OR ENTRY POINT]`
- `[NETWORK, PROCESS, IDENTITY, OR ORGANIZATIONAL BOUNDARY]`

Link to the architecture diagram and identify where data crosses a trust boundary.

## 5. Authentication and session handling

- Authentication method: `[METHOD]`
- Session or token lifetime: `[REQUIREMENT OR TBD]`
- Reauthentication conditions: `[CONDITION]`
- Service identities: `[APPROACH]`

## 6. Authorization

- Authorization model: `[ROLE, ATTRIBUTE, POLICY, OWNERSHIP, OR OTHER]`
- Default behavior: `[DENY/OTHER]`
- Privileged actions: `[ACTIONS AND APPROVALS]`
- Authorization test approach: `[METHOD]`

## 7. Secret and key management

- Storage: `[APPROVED MECHANISM]`
- Access: `[IDENTITIES AND BOUNDARIES]`
- Rotation: `[PROCESS]`
- Local development: `[SAFE APPROACH]`
- Prohibited locations: source code, test fixtures, logs, prompts, and committed local configuration

## 8. Data protection and privacy

- Data minimization: `[APPROACH]`
- Encryption in transit: `[REQUIREMENT]`
- Encryption at rest: `[REQUIREMENT]`
- Retention and deletion: `[REQUIREMENT]`
- Masking or redaction: `[APPROACH]`
- Privacy rights or legal obligations: `[VERIFIED OBLIGATION OR TBD]`

## 9. Threat and abuse-case review

| ID | Threat or abuse case | Preconditions | Potential effect | Controls | Test or evidence | Residual risk |
|---|---|---|---|---|---|---|
| TH-001 | `[THREAT]` | `[CONDITION]` | `[EFFECT]` | `[CONTROLS]` | `[TEST]` | `[RISK]` |

Consider at least:

- Unauthorized access
- Privilege escalation
- Injection or unsafe input handling
- Data leakage through errors, logs, exports, or prompts
- Broken object or tenant isolation
- Replay, duplicate, or forged requests
- Denial of service and dependency exhaustion
- Supply-chain and dependency risk
- Misuse by an authorized insider
- Unsafe administrative or automated actions

## 10. Audit and monitoring

- Events to audit: `[EVENTS]`
- Fields to exclude or redact: `[FIELDS]`
- Alert conditions: `[CONDITIONS]`
- Audit retention: `[REQUIREMENT]`
- Review owner: `[OWNER]`

## 11. Security testing

- Static checks: `[CHECKS]`
- Dependency checks: `[CHECKS]`
- Authentication and authorization tests: `[TESTS]`
- Input and output validation tests: `[TESTS]`
- Manual review or penetration testing: `[WHEN REQUIRED]`

## 12. Incident and vulnerability handling

- Reporting path: `[PATH]`
- Triage owner: `[OWNER]`
- Containment or disablement approach: `[APPROACH]`
- Evidence preservation: `[APPROACH]`
- Notification obligations: `[VERIFIED REQUIREMENT OR TBD]`

## Approval

| Role | Name | Decision | Date | Notes |
|---|---|---|---|---|
| Security reviewer | `[NAME]` | `[DECISION]` | `[DATE]` | `[NOTES]` |
| Technical owner | `[NAME]` | `[DECISION]` | `[DATE]` | `[NOTES]` |
