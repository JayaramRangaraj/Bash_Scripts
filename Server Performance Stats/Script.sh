#!/bin/bash

################################################################################
#                       Server Performance Script                              #
#                                                                              #
# This script provide the information about system details , memory detials    #
# and cpu, memory consuming details                                            #
#                                                                              #
#                                                                              #
# Change History                                                               #
# 11/11/2019  Jayaram Rangaraj    					       #
#									       #
################################################################################

# CPU Usage
echo "---------------------------"
echo "        SYSTEM STATS       "
echo "---------------------------"
CPU_USAGE=$(top -bn2 | grep "%Cpu" | tail -1 | awk '{print 100-$8}')

echo ""
echo "OS Version : $(grep "PRETTY_NAME" /etc/os-release | cut -d= -f2 | sed 's/"//g')"
echo "System Uptime : $(uptime -p | cut -d' ' -f2-)"
echo "CPU usage : ${CPU_USAGE}%"
echo "Load Average : $(uptime | cut -d' ' -f12-)"
echo "Current User : $(who | cut -d : -f1)"

# Memory Usage
MEMORY_STATS=$(free -m | grep "Mem")
TOTAL_MEM=$(echo "$MEMORY_STATS" | awk '{print $2}')
FREE_MEM=$(echo "$MEMORY_STATS" | awk '{print $4}')
USED_MEM=$(echo "$MEMORY_STATS" | awk '{print $3}')
AVAIL_MEM=$(echo "$MEMORY_STATS" | awk '{print $7}')

# Calculate percentages
FREE_PERCENT=$(awk -v free="$FREE_MEM" -v total="$TOTAL_MEM" 'BEGIN {print (free / total) * 100}')
USED_PERCENT=$(awk -v used="$USED_MEM" -v total="$TOTAL_MEM" 'BEGIN {print (used / total) * 100}')
AVAIL_PERCENT=$(awk -v avail="$AVAIL_MEM" -v total="$TOTAL_MEM" 'BEGIN {print (avail / total) * 100}')

echo ""
echo "--------MEMORY DETAILS------------"

printf "%-20s %-10s\n" "Total Memory" "$TOTAL_MEM MB"
printf "%-20s %-10s %-.2f%%\n" "Used" "$USED_MEM MB" "$USED_PERCENT"
printf "%-20s %-10s %-.2f%%\n" "Free" "$FREE_MEM MB" "$FREE_PERCENT"
printf "%-20s %-10s %-.2f%%\n" "Available" "$AVAIL_MEM MB" "$AVAIL_PERCENT"

# Top 5 CPU-consuming processes
echo ""
echo "----Top 5 CPU-consuming processes----"
ps -eo comm,%cpu --sort=-%cpu | awk '!seen[$1]++' | head -6


# Top 5 Memory-consuming processes
echo ""
echo "---Top 5 MEMORY-consuming processes---"
ps -eo comm,%mem --sort=-%mem | awk '!seen[$1]++' | head -6

