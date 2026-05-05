#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker could not be found. Please install Docker to run this script."
    exit
fi

# Down all containers and remove volumes to prepare cleaning environment for testing
docker compose down -v
# Clean up data directories for clean testing environment
docker run --rm -v "$(pwd)":/current-dir busybox bash -c "rm -rf /current-dir/mongo-data/* /current-dir/mariadb-data/*"