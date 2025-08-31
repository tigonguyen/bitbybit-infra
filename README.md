# DailyDelta Infrastructure

This repository manages the infrastructure and deployment configurations for DailyDelta - an IT skills learning platform starting with touch typing fundamentals.

## 🚀 Quick Start for New Context Windows
- **[PROJECT_GUIDE.md](./PROJECT_GUIDE.md)** - Essential overview for AI assistants
- **[.cursorrules](./.cursorrules)** - Multi-repository development rules  
- **[ARCHITECTURE.md](./ARCHITECTURE.md)** - Complete system architecture
- **[CONTEXT.md](./CONTEXT.md)** - Project decisions and history

## Repository Structure

```
dailydelta-infra/
├── local-test/          # Local development with Docker Compose
│   ├── docker-compose.yml
│   ├── start-dev.sh
│   ├── stop-dev.sh
│   ├── Makefile
│   └── .env.example
├── aws/                 # AWS deployment configurations (future)
├── amplify.yml          # AWS Amplify build configuration
└── README.md           # This file
```

## Project Architecture

DailyDelta consists of three repositories:

- **[dailydelta-fe](../dailydelta-fe)**: React frontend with TypeScript and Tailwind CSS
- **[dailydelta-be](../dailydelta-be)**: Go backend with authentication and API services  
- **[dailydelta-infra](.)**: Infrastructure, deployment, and development environment

## Deployment Strategies

### 🚀 AWS Amplify (Recommended for Frontend)

AWS Amplify provides an excellent platform for React applications with:
- Automatic CI/CD from Git repositories
- Global CDN distribution
- Custom domain support
- Environment variable management
- Built-in monitoring and analytics

### 🐳 Local Development

For local development and testing:
- Navigate to `local-test/` directory
- Use Docker Compose for full-stack development
- See [local-test/README.md](./local-test/README.md) for details

## AWS Infrastructure Recommendation

### Simple Amplify + API Gateway + Lambda Setup

```
Frontend (React)     Backend Services
┌─────────────────┐  ┌─────────────────┐
│   AWS Amplify   │  │  API Gateway    │
│   - React App   │  │  + Lambda       │
│   - Static CDN  │──▶│  - Auth API     │
│   - Git Deploy  │  │  - Lessons API  │
│   - Custom DNS  │  │  - Progress API │
└─────────────────┘  └─────────────────┘
                            │
                     ┌─────────────────┐
                     │   DynamoDB      │
                     │   - Users       │
                     │   - Progress    │
                     │   - Lessons     │
                     └─────────────────┘
```

### Estimated AWS Costs (Early Stage)
- **AWS Amplify**: $1-5/month (hosting + builds)
- **API Gateway**: $3-10/month (requests + data transfer)
- **Lambda**: $0-5/month (execution time)
- **DynamoDB**: $1-3/month (storage + reads/writes)
- **Total**: ~$5-25/month for moderate usage

## Getting Started

### Local Development
1. Clone all three repositories in the same parent directory
2. Navigate to `local-test/`
3. Run `./start-dev.sh`
4. Access at http://localhost:3000

### AWS Amplify Deployment
See deployment prerequisites and steps below.

## Future Infrastructure Plans

- **Authentication**: AWS Cognito for user management
- **API**: API Gateway + Lambda for backend services
- **Database**: DynamoDB for user progress and content
- **Storage**: S3 for lesson content and media
- **Monitoring**: CloudWatch for logs and metrics
- **CI/CD**: GitHub Actions for automated deployments