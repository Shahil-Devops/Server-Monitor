#!/bin/bash
set -e
# Memory Usage
MEMORY_USAGE=$(free | awk '/Mem:/ {printf("%.0f", $3/$2 * 100)}')

echo "Memory Usage: ${MEMORY_USAGE}%" >> "$LOG_FILE"

if [ "$MEMORY_USAGE" -ge 80 ]
then
    echo "🚨 WARNING: Memory usage above 80%" >> "$LOG_FILE"
else
    echo "✅ Memory usage is healthy" >> "$LOG_FILE"
fi

echo "" >> "$LOG_FILE"

# Disk Usage
DISK_USAGE=$(df / | awk 'NR==2 {gsub("%","",$5); print $5}')

echo "Disk Usage: ${DISK_USAGE}%" >> "$LOG_FILE"

if [ "$DISK_USAGE" -ge 80 ]
then
    echo "🚨 WARNING: Disk usage above 80%" >> "$LOG_FILE"
else
    echo "✅ Disk usage is healthy" >> "$LOG_FILE"
fi

echo "" >> "$LOG_FILE"

# Uptime
echo "System Uptime:" >> "$LOG_FILE"
uptime -p >> "$LOG_FILE"

echo "" >> "$LOG_FILE"
