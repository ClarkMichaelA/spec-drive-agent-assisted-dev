# Operations and Support Plan

Status: Draft  
Owner: `[OPERATIONS OR TECHNICAL OWNER]`  
Last reviewed: `[YYYY-MM-DD]`

## 1. Service overview

- Service name: `[NAME]`
- Business owner: `[OWNER]`
- Technical owner: `[OWNER]`
- Support owner: `[OWNER]`
- Service hours or critical periods: `[HOURS]`
- Dependency owners: `[OWNERS]`

## 2. Environments

| Environment | Purpose | Access | Data allowed | Refresh or reset approach |
|---|---|---|---|---|
| Local | Development | `[ACCESS]` | `[DATA RULE]` | `[APPROACH]` |
| Test | Validation | `[ACCESS]` | `[DATA RULE]` | `[APPROACH]` |
| Production | Live use | `[ACCESS]` | `[DATA RULE]` | `[APPROACH]` |

## 3. Configuration

- Configuration sources: `[SOURCES]`
- Secret source: `[APPROVED MECHANISM]`
- Environment differences: `[DIFFERENCES]`
- Feature flags: `[APPROACH OR N/A]`
- Configuration validation: `[CHECK]`

## 4. Build and release

- Build command: `[COMMAND]`
- Artifact produced: `[ARTIFACT]`
- Promotion path: `[PATH]`
- Approval gates: `[GATES]`
- Deployment method: `[METHOD]`
- Post-deployment verification: `[CHECKS]`

## 5. Rollback and recovery

- Rollback trigger: `[CONDITION]`
- Application rollback: `[STEPS OR RUNBOOK LINK]`
- Data rollback or forward-fix: `[APPROACH]`
- Maximum acceptable recovery time: `[LINK TO OPS/NFR REQUIREMENT]`
- Maximum acceptable data loss: `[LINK TO OPS/NFR REQUIREMENT]`

## 6. Monitoring and alerting

| Signal | Why it matters | Normal range | Alert condition | Owner | Runbook |
|---|---|---|---|---|---|
| `[METRIC/LOG/HEALTH CHECK]` | `[REASON]` | `[RANGE]` | `[CONDITION]` | `[OWNER]` | `[LINK]` |

Alerts should be actionable. Avoid alerts that have no clear owner or response.

## 7. Logging

- Log destinations: `[DESTINATIONS]`
- Required context: `[CORRELATION ID, ACTOR, OPERATION, RESULT, ETC.]`
- Sensitive-data exclusions: `[DATA]`
- Retention: `[PERIOD OR REQUIREMENT]`
- Access: `[ROLES]`

## 8. Backup and restore

- Data covered: `[DATA]`
- Backup method and frequency: `[METHOD]`
- Encryption and access: `[CONTROLS]`
- Restore procedure: `[RUNBOOK LINK]`
- Restore test frequency: `[FREQUENCY]`
- Last tested: `[DATE OR NOT YET TESTED]`

## 9. Support and incident handling

- Intake path: `[PATH]`
- Severity definitions: `[LINK OR SUMMARY]`
- Escalation path: `[PATH]`
- Known diagnostic commands: `[SAFE COMMANDS OR RUNBOOKS]`
- User communication owner: `[OWNER]`

## 10. Runbook index

| Runbook | Trigger | Owner | Last tested |
|---|---|---|---|
| `[RUNBOOK NAME/LINK]` | `[TRIGGER]` | `[OWNER]` | `[DATE]` |

## 11. Operational readiness checklist

- [ ] Ownership and support hours are defined.
- [ ] Deployment and rollback are tested.
- [ ] Required dashboards and alerts exist.
- [ ] Logs exclude secrets and protected data.
- [ ] Backup and restore are tested when applicable.
- [ ] Known failure modes have runbooks.
- [ ] Capacity and dependency limits are understood.
- [ ] Support staff have the required access and training.
