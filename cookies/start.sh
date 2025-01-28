#!/usr/bin/env bash

hosts="trusted.local evil.local"

./scripts/hosts.sh add $hosts
docker compose up -d --build

trap 'docker compose down; ./scripts/hosts.sh del $hosts' SIGINT

# Display logs instead of sleeping
docker compose logs -f
