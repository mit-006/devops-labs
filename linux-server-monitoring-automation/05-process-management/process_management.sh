#!/bin/bash

set -e

OUTPUT="process_info.txt"

rm -f "$OUTPUT"
touch "$OUTPUT"

echo "========== PROCESS MANAGEMENT ==========" | tee -a "$OUTPUT"

echo "" | tee -a "$OUTPUT"
echo "Starting Background Process..." | tee -a "$OUTPUT"

ping google.com > ping_test.log &

PID=$!

echo "Background Process ID : $PID" | tee -a "$OUTPUT"

sleep 5

echo "" | tee -a "$OUTPUT"
echo "===== Using ps =====" | tee -a "$OUTPUT"

ps -fp $PID | tee -a "$OUTPUT"

echo "" | tee -a "$OUTPUT"
echo "===== Running Processes =====" | tee -a "$OUTPUT"

ps aux | grep ping | tee -a "$OUTPUT"

echo "" | tee -a "$OUTPUT"
echo "===== Process Tree =====" | tee -a "$OUTPUT"

pstree -p | tee -a "$OUTPUT"

echo "" | tee -a "$OUTPUT"
echo "===== Memory Usage =====" | tee -a "$OUTPUT"

free -h | tee -a "$OUTPUT"

echo "" | tee -a "$OUTPUT"
echo "===== CPU Information =====" | tee -a "$OUTPUT"

lscpu | tee -a "$OUTPUT"

echo "" | tee -a "$OUTPUT"
echo "===== Killing Process =====" | tee -a "$OUTPUT"

kill $PID

sleep 2

echo "" | tee -a "$OUTPUT"
echo "===== Verification =====" | tee -a "$OUTPUT"

ps -p $PID | tee -a "$OUTPUT"

echo "" | tee -a "$OUTPUT"
echo "Task Completed Successfully." | tee -a "$OUTPUT"
