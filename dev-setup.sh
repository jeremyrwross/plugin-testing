#!/bin/bash

set -e

# Load environment variables from .env
export $(grep -v '^#' .env | xargs)

# Build and start the containers
echo "Building Docker containers for ${COMPOSE_PROJECT_NAME}..."
docker-compose -f .development/docker-compose.yml --env-file .env up --build -d

echo "Setup complete! Access your site at http://127.0.0.1:8082 and Adminer at http://127.0.0.1:8083"
