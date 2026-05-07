# Week 2 Networking Runbook Submission

## Overview
This submission demonstrates basic networking troubleshooting using a local HTTP service and public endpoint analysis.

The work includes:
- A locally hosted HTTP service on an assigned port
- Controlled failure scenarios (wrong port and service stopped)
- Recovery after failure
- Public endpoint investigation using curl

---

## Assigned Port
My assigned port is: 8005

This port was used to run the local HTTP service.

---

## Project Structure

### Scripts
- scripts/start-simple-service.sh  
  Starts a simple HTTP service that listens on the assigned port and serves one request.

### Evidence Files
- evidence/local-healthy-checks.txt → healthy service verification
- evidence/local-failure-checks.txt → failure scenarios (wrong port + stopped service)
- evidence/public-endpoint-checks.txt → external endpoint behaviour analysis

### Notes
- notes/script-explanation.txt → explanation of the script logic
- notes/troubleshooting-runbook.md → troubleshooting steps and reasoning
- notes/recovery-log.md → recovery summary after failure

---

## Summary
This submission demonstrates understanding of:
- service health validation
- failure identification
- recovery process
- basic HTTP/DNS/TLS behaviour differences
