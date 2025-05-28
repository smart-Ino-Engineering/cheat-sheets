#!/bin/sh

# Create network if missing
docker network inspect proxy >/dev/null 2>&1 || docker network create proxy

# Stop existing containers
docker compose down

# Initialize SSL certificate storage
if [ -f acme.json ]; then
    rm acme.json
fi
touch acme.json && chmod 600 acme.json

# Start services
docker compose up --build -d