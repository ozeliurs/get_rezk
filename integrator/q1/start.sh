#!/usr/bin/env bash

./hosts.sh add
docker compose up -d

trap 'docker compose down; ./hosts.sh del' SIGINT

# Display logs instead of sleeping
docker compose logs -f
