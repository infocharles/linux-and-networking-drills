# Recovery Log

## Failure 1: Service not running
Symptom:
curl returned "connection refused" on the correct port.

Cause:
The service had already handled one request and exited.

Recovery:
Restarted the service using the start-simple-service.sh script.

Verification:
curl returned HTTP 200 OK after restart.

---

## Failure 2: Wrong port
Symptom:
curl failed when using port 8999.

Cause:
No service was listening on that port.

Recovery:
Used the correct assigned port (8005).

Verification:
Successful HTTP response received on correct port.

# Well Explanatary Recovery log

# Recovery Log

## Incident Summary
The local HTTP service stopped after handling a single request, causing connection refused errors when tested again.

---

## Symptoms
- curl returned "connection refused" on port 8005
- service no longer responded after initial success

---

## Investigation Steps
1. Checked service status using curl
2. Confirmed no listening process after first request
3. Verified correct port was still assigned

---

## Root Cause
The service is designed to handle only one request and then exit automatically.

---

## Resolution
Restarted the service using:

./scripts/start-simple-service.sh

---

## Verification
After restart:
- curl returned HTTP/1.1 200 OK
- service responded correctly on port 8005

---

## Outcome
Service behaviour confirmed as expected. No persistent fault detected.
