#!/bin/bash

# Colour codes
RED='\033[0;31m'
GREEN='\033[0;32m'
RESET='\033[0m'

if [ -z "$1" ]; then
	echo -e "${RED} File is required"
	exit 1
fi

echo""
echo -e  "${GREEN}---Nginx Log Analyse---"
echo ""

# Display the top 5 IP addresses with the most requests
echo -e  "---Top 5 IP addresses---${RESET}"
awk '{print $1}' $1 | sort | uniq -c | sort -nr | awk '{print $2 " - " $1 " requests"}' | head -n 5
echo ""

# Display the top 5 requested URLs
echo -e  "${GREEN}---Top 5 requested URLs---${RESET}"
cut -d' ' -f7 $1 | sort | uniq -c | sort -nr | awk '{print $2 " - " $1 " requests"}' | head -n 5
echo ""

# Display the top 5 HTTP response codes
echo -e  "${GREEN}---Top 5 HTTP response codes---${RESET}"
cut -d' ' -f9 $1 | grep -E '^[0-9]{3}$' | sort | uniq -c | sort -nr | awk '{print $2 " - " $1 " requests"}' | head -n 5
echo ""

# Display the top 5 User-Agents
echo -e "${GREEN}---Top 5 User-Agents---${RESET}"
cut -d'"' -f6 $1 | sort | uniq -c | sort -nr | head -n 5 | awk '{count=$1; $1=""; sub(/^ /, ""); print $0 " - " count " requests"}'