#!/bin/bash

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
LOGFILE="user_process_$DATE.log"

mkdir -p logs
echo "=== User & Process Monitoring Report at $DATE ===" > logs/$LOGFILE

echo "--- Logged-in Users ---" >> logs/$LOGFILE
who >> logs/$LOGFILE

echo "" >> logs/$LOGFILE
echo "--- CPU Heavy ---" >> logs/$LOGFILE
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6 >> logs/$LOGFILE

echo "" >> logs/$LOGFILE
echo "--- Memory Heavy ---" >> logs/$LOGFILE
ps -eo pid,comm,%cpu,%mem --sort==-%mem | head -n 6 >> logs/$LOGFILE

echo "Report saved in logs/LOGFILE"
