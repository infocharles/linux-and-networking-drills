# Healthy State Troubleshooting

## Check 1: Listening Port

Command:
ss -tuln | grep 8005

Why I ran it:
To verify that a process is actively listening on my assigned port.

Key output:
LISTEN on port 8005

What it proves:
A service is bound to the port and ready to accept connections.

What it does NOT prove:
It does not confirm that the service returns valid HTTP responses.

---

## Check 2: HTTP Response

Command:
curl -i http://localhost:8005

Why I ran it:
To confirm that the service responds with a valid HTTP response.

Key output:
HTTP/1.1 200 OK

Week 2 simple service is running on port 8005

What it proves:
The service is working correctly and returns a valid HTTP response locally.

What it does NOT prove:
This does not prove that the service is accessible from other machines.
It only confirms local behaviour.

## Failure Case 1: Service Not Running

Command:
curl http://localhost:8005

Why I ran it:
To check if the service was still running after handling a request.

Key output:
Connection refused

What it proves:
No process is listening on the port.

What it does NOT prove:
It does not indicate a wrong port, only that the service is not active.

---

## Failure Case 2: Wrong Port

Command:
curl http://localhost:8999

Why I ran it:
To simulate connecting to an incorrect port.

Key output:
Connection refused

What it proves:
No service is listening on that port.

What it does NOT prove:
It does not indicate the service is down, only that the port is incorrect.

---

## Recovery

Action:
Restarted the service script.

Result:
HTTP 200 OK response confirmed the service was restored.

## Public Endpoint Behaviour Analysis

### 1. HTTPS Healthy (example.com)

Command:
curl -I https://example.com

Observation:
HTTP/2 200 OK response returned successfully.

Interpretation:
This shows a fully healthy HTTPS connection with valid DNS resolution, TLS handshake, and HTTP response.

---

### 2. Plain HTTP (neverssl.com)

Command:
curl -I http://neverssl.com

Observation:
HTTP/1.1 200 OK returned without encryption.

Interpretation:
This confirms successful HTTP communication without TLS encryption.

---

### 3. Redirect Behaviour (httpbin)

Command:
curl -I https://httpbin.org/redirect/1

Observation:
HTTP 302 Found with Location header.

Interpretation:
This indicates a redirect response. The client is expected to follow a new URL.

---

### 4. Failure Case (DNS/TLS)

Command:
curl -I https://does-not-exist.invalid

Observation:
DNS resolution failed (could not resolve host).

Interpretation:
This is a DNS-level failure, meaning the domain does not exist or cannot be resolved.

# Troubleshooting Runbook

## 1. Port Assignment
Command:
ls -al /home

Purpose:
To identify the correct user position and map it to an assigned port (8000–8020).

Result:
My assignment was port 8005.

---

## 2. Starting the Service
Command:
./scripts/start-simple-service.sh

Purpose:
To start the local HTTP service.

Result:
Service listens on port 8005.

---

## 3. Healthy State Validation

### Check 1: Listening Port
Command:
ss -tuln | grep 8005

What it shows:
A process is actively listening on the port.

Conclusion:
Service is running and bound to the port.

---

### Check 2: HTTP Response
Command:
curl -i http://localhost:8005

What it shows:
HTTP/1.1 200 OK response with service message.

Conclusion:
Service is functioning correctly at application level.

---

## 4. Failure Case: Wrong Port
Command:
curl http://localhost:8999

Observation:
Connection refused.

Conclusion:
No service is listening on this port.

---

## 5. Failure Case: Service Not Running
Command:
curl http://localhost:8005 (after request already served)

Observation:
Connection refused.

Conclusion:
Service had already stopped after serving one request.

---

## 6. Public Endpoint Analysis

### HTTPS Healthy
example.com returned HTTP 200 OK → valid secure connection.

### HTTP Plain
neverssl.com returned HTTP 200 OK → unencrypted HTTP.

### Redirect
httpbin returned 302 redirect → server instructs client to follow another URL.

### Failure Case
does-not-exist.invalid failed DNS resolution → domain does not exist.

---

## Summary
The system behaviour was analysed across:
- local service health
- controlled failure states
- recovery process
- external network behaviour
