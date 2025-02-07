#!/bin/bash

# Check if the script is run with sudo privileges
if [[ $EUID -ne 0 ]]; then
    echo "This script requires sudo privileges. Please run it with sudo."
    exit 1
fi

while true; do
    read -p "Enter username (or press Enter to quit): " USERNAME
    [[ -z "$USERNAME" ]] && break

    read -s -p "Enter new password: " PASSWORD
    echo

    echo "$USERNAME:$PASSWORD" | chpasswd && echo "Success! Password updated for $USERNAME."
done

echo "All passwords updated!"




