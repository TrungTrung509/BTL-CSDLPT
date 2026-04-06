#!/bin/bash
# Reset script for CSDL Phan Tan infrastructure
# WARNING: This will DELETE all data!

echo "=========================================="
echo "CSDL Phan Tan - RESET ALL DATA"
echo "=========================================="
echo "WARNING: This will DELETE all data!"
echo ""

read -p "Are you sure? Type 'yes' to confirm: " confirm

if [ "$confirm" != "yes" ]; then
    echo "Cancelled."
    exit 0
fi

cd "$(dirname "$0")"

echo "Stopping and removing all containers..."
docker-compose down -v

echo "Removing images..."
docker-compose down --rmi local

echo ""
echo "=========================================="
echo "All data has been reset."
echo "To start fresh: ./scripts/start.sh"
echo "=========================================="
