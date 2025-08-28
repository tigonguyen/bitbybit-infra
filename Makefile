# BitByBit Development Makefile

.PHONY: help start stop logs build clean restart

# Default target
help:
	@echo "BitByBit Development Commands:"
	@echo ""
	@echo "  make start    - Start the development environment"
	@echo "  make stop     - Stop the development environment"
	@echo "  make restart  - Restart the development environment"
	@echo "  make logs     - View all service logs"
	@echo "  make build    - Rebuild all services"
	@echo "  make clean    - Stop and remove all containers/volumes"
	@echo "  make status   - Check service status"
	@echo ""

# Start development environment
start:
	@echo "🚀 Starting BitByBit development environment..."
	docker compose up --build -d
	@echo "✅ Services started!"
	@echo "📱 Frontend: http://localhost:3000"
	@echo "🔐 Backend:  http://localhost:8080"

# Stop development environment
stop:
	@echo "🛑 Stopping BitByBit development environment..."
	docker compose down
	@echo "✅ Services stopped!"

# Restart development environment
restart: stop start

# View logs
logs:
	docker compose logs -f

# Rebuild services
build:
	@echo "🔨 Rebuilding services..."
	docker compose build --no-cache
	@echo "✅ Build complete!"

# Clean everything
clean:
	@echo "🧹 Cleaning up containers, networks, and volumes..."
	docker compose down --volumes --remove-orphans
	docker system prune -f
	@echo "✅ Cleanup complete!"

# Check status
status:
	@echo "📊 Service Status:"
	docker compose ps
