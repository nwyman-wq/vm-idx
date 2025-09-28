#!/bin/bash

# 🎨 Colors
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RESET="\e[0m"

clear
echo -e "${CYAN}======================================${RESET}"
echo -e "${GREEN}   🚀 Google VM Installer (Part 1) 🚀 ${RESET}"
echo -e "${CYAN}======================================${RESET}"

# Ask for workspace name
echo -ne "${YELLOW}Enter your workspace name: ${RESET}"
read WORKSPACE

# Define paths
BASE="/home/user"
WORKDIR="$BASE/$WORKSPACE"
IDXDIR="$WORKDIR/.idx"

# Create directories
echo -e "${CYAN}Creating workspace at: $WORKDIR ...${RESET}"
mkdir -p "$IDXDIR"

# Move dev.nix into .idx folder
if [ -f "dev.nix" ]; then
    mv dev.nix "$IDXDIR/dev.nix"
    echo -e "${GREEN}✔ dev.nix moved to $IDXDIR/dev.nix${RESET}"
else
    echo -e "${RED}✘ dev.nix not found in current directory!${RESET}"
fi

# Save workspace name for continue.sh
echo "$WORKSPACE" > /tmp/workspace_name.txt

echo -e "\n${GREEN}✔ Part 1 complete! Now run:${RESET}"
echo -e "${CYAN}   ./continue.sh${RESET}"
