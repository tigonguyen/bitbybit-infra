# BitByBit Local Development

This directory contains the local development setup for BitByBit using Docker Compose.

## Prerequisites

- Docker Desktop installed and running
- Both `bitbybit-fe` and `bitbybit-be` repositories cloned in the same parent directory
- Repository structure should be:
  ```
  parent-directory/
  ├── bitbybit-fe/          # Frontend React app (files at root)
  ├── bitbybit-be/          # Backend Go service (files at root)
  └── bitbybit-infra/
      └── local-test/       # This directory
  ```

## Quick Start

1. **Navigate to this directory:**
   ```bash
   cd local-test
   ```

2. **Start the development environment:**
   ```bash
   ./start-dev.sh
   ```

3. **Access the application:**
   - Frontend: http://localhost:3000
   - Backend: http://localhost:8080
   - Health Check: http://localhost:8080/health

## Available Commands

```bash
# Start development environment
./start-dev.sh

# Stop development environment
./stop-dev.sh

# Or use Docker Compose directly
docker compose up --build -d
docker compose down

# View logs
docker compose logs -f
docker compose logs -f frontend
docker compose logs -f auth-service

# Use Makefile shortcuts
make start    # Start services
make stop     # Stop services
make logs     # View logs
```

## Environment Configuration

- Copy `.env.example` to `.env` to customize environment variables
- The start script will create `.env` automatically if it doesn't exist

## Services

- **Frontend**: React application with TypeScript and Tailwind CSS
- **Backend**: Go authentication service with JWT and CORS
- **Network**: Both services run on a shared Docker network for communication

## Notes

This local setup is separate from the AWS Amplify deployment configuration which will be managed at the repository root level.
