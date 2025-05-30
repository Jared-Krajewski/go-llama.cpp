#!/bin/bash
echo "***"
echo "make clean -- removes all Docker containers, and networks"
echo "***"

read -p "WARNING: This script will DESTROY all Docker containers, and networks.  Are you sure? (y/N) " -r answer
if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
    echo "Aborting."
    exit 0
fi

echo "1 - Stopping containers:"
docker stop $(docker ps -aq)

echo "2 - Removing containers:"
docker rm -f $(docker ps -aq)

echo "4 - Removing Networks:"
docker network prune -f

echo "All Docker containers, and networks removed."
