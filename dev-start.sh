#!/bin/bash

# Load environment variables from .env
export $(grep -v '^#' .env | xargs)

# Start the containers
echo "Starting Docker containers for ${COMPOSE_PROJECT_NAME}..."
docker-compose -f .development/docker-compose.yml up -d

echo "Containers started. Access your site at http://127.0.0.1:8082 and Adminer at http://127.0.0.1:8083"
