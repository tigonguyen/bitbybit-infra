#!/bin/bash

# BitByBit Development Environment Startup Script

echo "🚀 Starting BitByBit Development Environment..."

# Check if required repositories exist
if [ ! -d "../bitbybit-fe" ]; then
    echo "❌ Error: bitbybit-fe repository not found. Please ensure it's in the same parent directory."
    exit 1
fi

if [ ! -d "../bitbybit-be" ]; then
    echo "❌ Error: bitbybit-be repository not found. Please ensure it's in the same parent directory."
    exit 1
fi

# Create .env file if it doesn't exist
if [ ! -f ".env" ]; then
    echo "📄 Creating .env file from template..."
    cp .env.example .env
    echo "✅ .env file created. Please review and update if needed."
fi

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Error: Docker is not running. Please start Docker Desktop."
    exit 1
fi

# Stop any existing containers
echo "🛑 Stopping existing containers..."
docker compose down --remove-orphans

# Build and start services
echo "🔨 Building and starting services..."
docker compose up --build -d

# Wait for services to be ready
echo "⏳ Waiting for services to start..."
sleep 10

# Check service health
echo "🔍 Checking service health..."

# Check backend health
if curl -f http://localhost:8080/health > /dev/null 2>&1; then
    echo "✅ Backend service is healthy"
else
    echo "⚠️  Backend service may not be ready yet"
fi

# Check frontend
if curl -f http://localhost:3000 > /dev/null 2>&1; then
    echo "✅ Frontend service is healthy"
else
    echo "⚠️  Frontend service may not be ready yet"
fi

echo ""
echo "🎉 BitByBit Development Environment Started!"
echo ""
echo "📱 Frontend: http://localhost:3000"
echo "🔐 Backend:  http://localhost:8080"
echo "💊 Health:   http://localhost:8080/health"
echo ""
echo "📋 Available commands:"
echo "  docker compose logs -f          # View all logs"
echo "  docker compose logs -f frontend # View frontend logs"
echo "  docker compose logs -f auth-service # View backend logs"
echo "  docker compose down             # Stop all services"
echo ""
echo "🔧 To stop the environment: docker compose down"
