#!/bin/bash

# BitByBit Development Environment Stop Script

echo "🛑 Stopping BitByBit Development Environment..."

# Stop and remove containers, networks, volumes
docker compose down --remove-orphans

echo "✅ Development environment stopped successfully!"
echo ""
echo "💡 To restart: ./start-dev.sh"
