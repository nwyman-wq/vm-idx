#!/bin/bash

# 🎨 Colors
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RESET="\e[0m"

clear
echo -e "${CYAN}======================================${RESET}"
echo -e "${GREEN}   🚀 Google VM Installer Script 🚀   ${RESET}"
echo -e "${CYAN}======================================${RESET}"

# Ask for workspace name
echo -ne "${YELLOW}Enter your workspace name: ${RESET}"
read WORKSPACE

# Define paths
BASE="/home/user"
WORKDIR="$BASE/$WORKSPACE"
VMFOLDER="$WORKDIR/googlevm"

# Create workspace directory if not exists
echo -e "${CYAN}Creating workspace at: $WORKDIR ...${RESET}"
mkdir -p "$WORKDIR"

# Move dev.nix
if [ -f "dev.nix" ]; then
    mv dev.nix "$WORKDIR/"
    echo -e "${GREEN}✔ dev.nix moved to $WORKDIR/${RESET}"
else
    echo -e "${RED}✘ dev.nix not found in current directory!${RESET}"
fi

# Create googlevm folder
mkdir -p "$VMFOLDER"
echo -e "${GREEN}✔ Created $VMFOLDER${RESET}"

# Move ubuntu.sh and debian.sh
for file in ubuntu.sh debian.sh; do
    if [ -f "$file" ]; then
        mv "$file" "$VMFOLDER/"
        echo -e "${GREEN}✔ Moved $file to $VMFOLDER/${RESET}"
    else
        echo -e "${RED}✘ $file not found in current directory!${RESET}"
    fi
done

# Ask for installation choice
echo -e "\n${YELLOW}Which installation do you want?${RESET}"
echo -e "${CYAN}[1] Ubuntu${RESET}"
echo -e "${CYAN}[2] Debian${RESET}"
echo -ne "${YELLOW}Choose (1/2): ${RESET}"
read CHOICE

cd "$VMFOLDER"

case $CHOICE in
    1)
        if [ -f "ubuntu.sh" ]; then
            echo -e "${GREEN}🚀 Starting Ubuntu installation...${RESET}"
            bash ubuntu.sh
        else
            echo -e "${RED}✘ ubuntu.sh not found!${RESET}"
        fi
        ;;
    2)
        if [ -f "debian.sh" ]; then
            echo -e "${GREEN}🚀 Starting Debian installation...${RESET}"
            bash debian.sh
        else
            echo -e "${RED}✘ debian.sh not found!${RESET}"
        fi
        ;;
    *)
        echo -e "${RED}✘ Invalid choice! Exiting...${RESET}"
        ;;
esac
