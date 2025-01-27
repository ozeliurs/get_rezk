#!/bin/bash

# Define the IP address
IP="127.0.0.1"

# Function to add domains to /etc/hosts
add_domains() {
    for DOMAIN in "$@"; do
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
    for DOMAIN in "$@"; do
        if grep -q "$DOMAIN" /etc/hosts; then
            sudo sed -i".bak" "/$DOMAIN/d" /etc/hosts
            echo "Removed $DOMAIN from /etc/hosts"
        else
            echo "$DOMAIN not found in /etc/hosts"
        fi
    done
}

# Check if the script is run with at least two arguments
if [ $# -lt 2 ]; then
    echo "Usage: $0 {add|del} domain1 [domain2 ...]"
    exit 1
fi

# Extract the action and shift the arguments
ACTION=$1
shift

# Perform the action based on the argument
case $ACTION in
    add)
        add_domains "$@"
        ;;
    del)
        del_domains "$@"
        ;;
    *)
        echo "Invalid argument: $ACTION"
        echo "Usage: $0 {add|del} domain1 [domain2 ...]"
        exit 1
        ;;
esac
