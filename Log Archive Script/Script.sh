#!/bin/bash

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
RESET='\033[0m'

readonly TARGET="${1:-/var/log}"
readonly ARCHIVE_DIR=$HOME/log_archive

# Check if the specified target directory exists
if [ ! -d "$TARGET" ]; then
    echo -e "${RED}Directory $TARGET does not exist.${RESET}\nThese are the AVAILABLE LOGS :"
    ls /var/log
    exit 1
fi

# Confirmation to continue when argument not passed
if [ -z "$1" ]; then
    echo -e "${RED}No directory is passed.${RESET} Archive the entire LOG DIRECTORY $TARGET (y/n):"
    read -r FLAG


    if [ "$FLAG" != "y" ]; then
        echo -e "${RED}Exiting without archiving.${RESET}"
        exit 1
    fi
fi

# Define the archive directory
mkdir -p "$ARCHIVE_DIR" || { echo -e "${RED}Failed to create archive directory $ARCHIVE_DIR"; exit 1; }
echo "Using archive directory: $ARCHIVE_DIR"

CURRENT_DATE_TIME=$(date +%Y-%m-%d_%H-%M-%S)
FILE_PATH_AND_NAME="${ARCHIVE_DIR}/logs_archive_${CURRENT_DATE_TIME}.tar.gz"

# Create the archive
if sudo tar -czf "$FILE_PATH_AND_NAME" "$TARGET"; then
    echo -e "${GREEN}Archive created successfully at: $FILE_PATH_AND_NAME"
else
    echo -e "${RED}Error: Failed to create archive."
    exit 1
fi