# Server Baseline Handover

## Machine Information
This work was carried out on a shared Ubuntu server.  
Host details (hostname, OS version, kernel, and system time) are recorded in:

evidence/system-info.txt

## Access Context
Work was performed using my assigned Linux user account:

- Username: charles
- Group membership and privileges recorded in:
  evidence/users-and-groups.txt

This confirms my permissions and access boundaries on the shared host.

## Working Area
A structured working area was created in:

/home/charles/linux-baseline-work/

This was used to:
- organise scripts
- store notes
- demonstrate permission control

The submission folder itself is located at:

/week01-submissions/charles-linux-baseline/

## Directory Structure Created
The following structure was used:

- notes/ documentation
- scripts/ automation script
- evidence/ outputs and proof

## Permissions Approach
Permissions were applied deliberately:

- Script file  executable (`750`)
- Private notes  restricted (`600`)
- Working directory  controlled access (`700`)

This ensures:
- scripts can run safely
- sensitive files are not exposed
- other users cannot browse unnecessarily

Proof is recorded in:

evidence/permissions-proof.txt

## Health-Check Script
The script:

scripts/health-check.sh

Provides a quick system overview including:
- timestamp and hostname
- uptime / system load
- memory usage
- disk usage
- SSH service status
- cron service status


It also includes warning logic:
- disk usage above 80%

## Script Output
Output is written to:

evidence/health-check-output.txt

This file contains both manual and automated runs.

## Automation (Cron)
The script is scheduled using cron to run every 5 minutes.

Cron configuration is recorded in:

evidence/cron-proof.txt

This demonstrates:
- the job exists
- it runs automatically
- output is being appended over time

## Services and System Inspection
System inspection included:
- SSH service status
- cron service status
- running processes
- memory usage
- disk usage

Results are stored in:

evidence/services-proof.txt

## Assumptions and Limitations
- Work was performed without modifying other users or system-wide configurations
- Only user-level access was used unless required
- Service checks assume standard service names (e.g. ssh, cron)
- Health-check thresholds are basic and may require tuning in production

## Summary
This baseline provides:
- a clear working structure
- evidence of system inspection
- controlled permissions
- a reusable health-check script
- automated monitoring via cron

The submission is designed so another engineer can quickly understand the system state and continue work without ambiguity.
