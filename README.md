# BitByBit Infrastructure

This repository contains the Docker Compose configuration and infrastructure setup to run the complete BitByBit application locally.

## Prerequisites

- Docker Desktop installed and running
- Git
- The following repositories cloned in the same parent directory:
  ```
  parent-directory/
  ├── bitbybit-infra/     (this repository - infrastructure)
  ├── bitbybit-be/        (backend repository - Go service at root)
  └── bitbybit-fe/        (frontend repository - React app at root)
  ```

**Important**: Each repository now has its application code at the root level:
- `bitbybit-fe/` contains React app files directly (package.json, src/, etc.)
- `bitbybit-be/` contains Go service files directly (main.go, go.mod, etc.)

## Quick Start

1. **Clone all repositories** (if not already done):
   ```bash
   git clone <bitbybit-infra-repo-url>
   git clone <bitbybit-be-repo-url>
   git clone <bitbybit-fe-repo-url>
   ```

2. **Navigate to the infrastructure directory**:
   ```bash
   cd bitbybit-infra
   ```

3. **Start the development environment**:
   ```bash
   ./start-dev.sh
   ```

   Or manually with Docker Compose:
   ```bash
   docker-compose up --build
   ```

4. **Access the application**:
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:8080
   - Health Check: http://localhost:8080/health

## Services

### Frontend (React)
- **Port**: 3000
- **Technology**: React 19, TypeScript, Tailwind CSS
- **Repository**: bitbybit-fe
- **Features**: 
  - Modern responsive UI
  - Authentication forms
  - Real-time API integration

### Backend (Go)
- **Port**: 8080
- **Technology**: Go, Gorilla Mux, JWT
- **Repository**: bitbybit-be
- **Features**:
  - RESTful API
  - JWT authentication
  - CORS enabled
  - In-memory user storage (demo)

## API Endpoints

### Authentication
- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration  
- `GET /api/auth/validate` - Token validation

### User
- `GET /api/user/profile` - Get user profile (protected)

### System
- `GET /health` - Health check

## Demo Credentials

For testing, use these demo credentials:
- **Email**: demo@bitbybit.dev
- **Password**: password123

## Environment Configuration

The application uses the following environment variables:

### Backend
- `PORT`: Server port (default: 8080)
- `JWT_SECRET`: JWT signing secret
- `CORS_ALLOWED_ORIGINS`: Allowed CORS origins

### Frontend
- `REACT_APP_API_BASE_URL`: Backend API URL
- `REACT_APP_AUTH_SERVICE_URL`: Auth service URL

## Development Commands

```bash
# Start all services
docker-compose up --build

# Start in detached mode
docker-compose up -d --build

# View logs
docker-compose logs -f

# View specific service logs
docker-compose logs -f frontend
docker-compose logs -f auth-service

# Stop all services
docker-compose down

# Rebuild specific service
docker-compose build frontend
docker-compose build auth-service

# Remove all containers and volumes
docker-compose down --volumes --remove-orphans
```

## Project Structure

```
bitbybit-infra/
├── docker-compose.yml      # Multi-service orchestration
├── .env                    # Environment variables
├── .env.example           # Environment template
├── start-dev.sh           # Development startup script
├── stop-dev.sh            # Development stop script
├── Makefile               # Development commands
├── .gitignore             # Git ignore rules
└── README.md              # This file

../bitbybit-fe/             # Frontend repository (React app at root)
├── src/                   # React source code
├── public/                # Static assets
├── package.json           # Dependencies
├── Dockerfile             # Frontend container
├── tailwind.config.js     # Tailwind configuration
├── tsconfig.json          # TypeScript configuration
└── README.md              # Frontend documentation

../bitbybit-be/             # Backend repository (Go service at root)
├── main.go                # Go application entry point
├── go.mod                 # Go module definition
├── go.sum                 # Go dependencies
├── Dockerfile             # Backend container
└── README.md              # Backend documentation
```

## Troubleshooting

### Services won't start
1. Check if Docker is running: `docker info`
2. Ensure all repositories are in the correct directory structure
3. Check logs: `docker-compose logs`

### Frontend can't connect to backend
1. Verify backend is running: `curl http://localhost:8080/health`
2. Check CORS configuration in backend
3. Verify environment variables are set correctly

### Port conflicts
If ports 3000 or 8080 are already in use:
1. Stop other services using those ports
2. Or modify the ports in `docker-compose.yml`

## Next Steps

- [ ] Add database integration (PostgreSQL)
- [ ] Implement proper user management
- [ ] Add monitoring and logging
- [ ] Set up CI/CD pipeline
- [ ] Add more microservices

## Contributing

1. Make changes in the respective repositories (bitbybit-fe, bitbybit-be)
2. Test locally using this infrastructure setup
3. Update this README if infrastructure changes are needed