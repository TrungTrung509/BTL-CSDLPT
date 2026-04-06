#!/bin/bash
# Stop script for CSDL Phan Tan infrastructure

echo "=========================================="
echo "CSDL Phan Tan - Stopping Services"
echo "=========================================="

cd "$(dirname "$0")"

echo "Stopping services..."
docker-compose stop

echo ""
echo "=========================================="
echo "Services stopped. Data is preserved."
echo "To start again: ./scripts/start.sh"
echo "To remove everything: docker-compose down -v"
echo "=========================================="
