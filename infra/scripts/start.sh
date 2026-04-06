#!/bin/bash
# Start script for CSDL Phan Tan infrastructure

echo "=========================================="
echo "CSDL Phan Tan - Starting Services"
echo "=========================================="

cd "$(dirname "$0")"

# Check if .env exists
if [ ! -f .env ]; then
    echo "Creating .env from .env.example..."
    cp .env.example .env
    echo ".env created. Please review and update if needed."
fi

# Create necessary directories
echo "Creating necessary directories..."
mkdir -p db/site_hanoi/init db/site_nhatrang/init db/site_hcmc/init
mkdir -p db/common/init
mkdir -p scripts

# Pull latest images
echo "Pulling latest images..."
docker-compose pull

# Start services
echo "Starting services..."
docker-compose up -d

# Wait for services to be healthy
echo "Waiting for services to be healthy..."
sleep 10

# Check status
echo ""
echo "=========================================="
echo "Service Status:"
echo "=========================================="
docker-compose ps

echo ""
echo "=========================================="
echo "Connection Info:"
echo "=========================================="
echo "PostgreSQL Hanoi:   localhost:5432"
echo "PostgreSQL NhaTrang: localhost:5433"
echo "PostgreSQL HCM:     localhost:5434"
echo "Redis:              localhost:6379"
echo "Elasticsearch:      localhost:9200"
echo "Kibana:             localhost:5601"
echo ""
echo "Access Kibana at: http://localhost:5601"
echo ""
echo "To view logs: docker-compose logs -f"
echo "=========================================="
