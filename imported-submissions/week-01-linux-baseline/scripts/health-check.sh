#!/bin/bash

echo "===== Week 1 Health Check ====="
echo "Timestamp: $(date)"
echo "Hostname: $(hostname)"
echo ""

echo "Uptime:"
uptime
echo ""

echo "Memory usage:"
free -m
echo ""

echo "Disk usage for the root filesystem:"
df -h /
echo ""

echo "SSH service state: $(systemctl is-active ssh 2>/dev/null || echo unknown)"
echo "Cron service state: $(systemctl is-active cron 2>/dev/null || echo unknown)"

disk_percent=$(df -P / | awk 'NR==2 {gsub(/%/, "", $5); print $5}')

if [ "$disk_percent" -ge 80 ]; then
  echo "WARNING: Root filesystem usage is above 80 percent"
else
  echo "OK: Root filesystem usage is below 80 percent"
fi
