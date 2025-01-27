#!/bin/bash

# Define the domains and the IP address
DOMAINS=("host.local" "evil.local")
IP="127.0.0.1"

# Function to add domains to /etc/hosts
add_domains() {
    for DOMAIN in "${DOMAINS[@]}"; do
        if ! grep -q "$DOMAIN" /etc/hosts; then
            echo "$IP $DOMAIN" | sudo tee -a /etc/hosts > /dev/null
            echo "Added $DOMAIN to /etc/hosts"
        else
            echo "$DOMAIN already exists in /etc/hosts"
        fi
    done
}

# Function to remove domains from /etc/hosts
del_domains() {
    for DOMAIN in "${DOMAINS[@]}"; do
        if grep -q "$DOMAIN" /etc/hosts; then
            sudo sed -i".bak" "/$DOMAIN/d" /etc/hosts
            echo "Removed $DOMAIN from /etc/hosts"
        else
            echo "$DOMAIN not found in /etc/hosts"
        fi
    done
}

# Check if the script is run with an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 {add|del}"
    exit 1
fi

# Perform the action based on the argument
case $1 in
    add)
        add_domains
        ;;
    del)
        del_domains
        ;;
    *)
        echo "Invalid argument: $1"
        echo "Usage: $0 {add|del}"
        exit 1
        ;;
esac
