# BitByBit Multi-Repository Architecture

## System Overview
BitByBit is an IT skills learning platform designed with a microservices architecture for scalability and maintainability.

## Repository Structure
```
bitbybit-project/
├── bitbybit-fe/          # React TypeScript Frontend
├── bitbybit-be/          # Go Authentication Service
└── bitbybit-infra/       # Infrastructure & Deployment
```

## Frontend Architecture (bitbybit-fe)
```
src/
├── pages/
│   ├── Introduction.tsx     # Homepage (6 courses)
│   ├── Login.tsx           # Authentication page  
│   ├── Courses.tsx         # All courses (9 total)
│   ├── TypingCourse.tsx    # Typing lessons overview
│   └── TypingLesson.tsx    # Individual typing practice
├── components/             # Reusable UI components
└── App.tsx                # React Router configuration
```

### Frontend Features
- **Course System**: Progressive learning path with 6 core courses
- **Typing Practice**: 8 interactive lessons with real-time feedback
- **Progress Tracking**: LocalStorage for offline progress, sync after login
- **Responsive Design**: Mobile-first with Tailwind CSS
- **Authentication**: JWT integration with Go backend

### Course Hierarchy
1. **Touch Typing** (Foundation - Green) ✅ Available
2. **Programming** (Foundation - Purple) 🚧 Coming Soon
3. **DSA** (Intermediate - Teal) 🚧 Coming Soon
4. **Cloud Computing** (Advanced - Sky Blue) 🚧 Coming Soon
5. **DevOps** (Advanced - Indigo) 🚧 Coming Soon
6. **Cybersecurity** (Advanced - Gray) 🚧 Coming Soon

## Backend Architecture (bitbybit-be)
```
main.go                   # Go HTTP server with JWT auth
├── Authentication        # JWT token generation/validation
├── User Management       # In-memory user storage (temp)
├── CORS Configuration    # Frontend-backend communication
└── Health Endpoints      # Service monitoring
```

### Backend Features
- **JWT Authentication**: Secure token-based auth
- **Password Hashing**: Bcrypt for security
- **CORS Support**: Cross-origin requests from frontend
- **RESTful API**: JSON endpoints for auth operations
- **Health Monitoring**: Service health checks

## Infrastructure (bitbybit-infra)
```
local-test/               # Local development environment
├── docker-compose.yml    # Multi-service orchestration
├── start-dev.sh         # Development startup script
├── stop-dev.sh          # Service shutdown script
└── Makefile             # Development shortcuts

aws/                     # AWS deployment configurations
├── amplify.yml          # Frontend build configuration
└── AWS_DEPLOYMENT_GUIDE.md
```

### Development Environments
- **Local**: Docker Compose for full-stack development
- **Staging**: AWS Amplify for frontend testing
- **Production**: AWS serverless architecture (planned)

## Data Flow
```
User Browser
    ↓ (HTTP/HTTPS)
React Frontend (Port 3000)
    ↓ (Axios/JWT)
Go Backend (Port 8080)
    ↓ (Future: DynamoDB)
Local Storage / Database
```

## Authentication Flow
1. User registers/logs in via React frontend
2. Frontend sends credentials to Go backend
3. Backend validates and returns JWT token
4. Frontend stores token for authenticated requests
5. Progress saves locally until login, then syncs

## Technology Stack
### Frontend
- **Framework**: React 18 with TypeScript
- **Styling**: Tailwind CSS with custom theme
- **Routing**: React Router DOM
- **HTTP Client**: Axios
- **Build Tool**: Create React App

### Backend
- **Language**: Go 1.21+
- **HTTP Framework**: net/http (stdlib)
- **Authentication**: JWT with custom middleware
- **Password Hashing**: bcrypt
- **CORS**: Custom middleware

### Infrastructure
- **Local Development**: Docker & Docker Compose
- **Frontend Hosting**: AWS Amplify
- **Backend**: AWS Lambda + API Gateway (planned)
- **Database**: DynamoDB (planned)
- **Monitoring**: CloudWatch (planned)

## Deployment Strategy
### Phase 1: Frontend Deployment ✅ Ready
- AWS Amplify hosting
- Automatic CI/CD from GitHub
- Custom domain support
- Environment variable management

### Phase 2: Backend Migration 🚧 Planned
- Convert Go service to AWS Lambda
- API Gateway for HTTP routing
- DynamoDB for user data
- JWT validation in Lambda

### Phase 3: Full Integration 🚧 Future
- User progress synchronization
- Advanced course content management
- Analytics and monitoring
- Performance optimization

## Security Considerations
- **JWT Tokens**: Secure authentication with expiration
- **CORS Policy**: Restricted cross-origin requests
- **HTTPS Only**: All production traffic encrypted
- **Environment Variables**: Secrets management
- **Input Validation**: Request sanitization

## Performance Considerations
- **Frontend**: Code splitting and lazy loading
- **Backend**: Efficient JWT validation
- **Database**: Optimized queries and indexing
- **CDN**: Global content distribution
- **Caching**: Strategic cache implementation

## Monitoring & Observability
- **Frontend**: Amplify build logs and analytics
- **Backend**: CloudWatch logs and metrics
- **Infrastructure**: AWS monitoring dashboard
- **User Analytics**: Course completion tracking
- **Error Tracking**: Comprehensive error logging
