#!/usr/bin/env bash

hosts="host.local sub.host.local"

../scripts/hosts.sh add $hosts
docker compose up -d

trap 'docker compose down; ../scripts/hosts.sh del $hosts' SIGINT

# Display logs instead of sleeping
docker compose logs -f
