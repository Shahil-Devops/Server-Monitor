#!/bin/bash
set -e
LOG_FILE="server_health.log"

echo "============================" >> $LOG_FILE
echo "Server Health Check - $(date)" >> $LOG_FILE
echo "============================" >> $LOG_FILE

echo "CPU Usage:" >> $LOG_FILE
top -bn1 | grep "Cpu(s)" >> $LOG_FILE

echo "" >> $LOG_FILE
echo "Memory Usage:" >> $LOG_FILE
free -h >> $LOG_FILE

echo "" >> $LOG_FILE
echo "Disk Usage:" >> $LOG_FILE
df -h >> $LOG_FILE

echo "" >> $LOG_FILE
echo "Top 5 Memory Consuming Processes:" >> $LOG_FILE
ps aux --sort=-%mem | head -6 >> $LOG_FILE

echo "" >> $LOG_FILE
echo "Health Check Completed!" >> $LOG_FILE

echo "Server health report saved to $LOG_FILE"
