# DevOpsita Project Guide for New Context Windows

## Quick Start for Cursor/AI Assistants

### Project Overview in 30 Seconds
DevOpsita = DevOps career training platform with 3 repositories:
- **devopsita-fe**: React frontend (8 DevOps courses, hands-on practice)
- **devopsita-be**: Go auth service (JWT, port 8080)  
- **devopsita-infra**: Docker development + AWS deployment

### Current Status
- ✅ **Working**: Local development, typing lessons, 6-course homepage
- 🚧 **Ready**: AWS Amplify deployment configs
- 📋 **Next**: Backend to serverless, full course content

## Essential File Locations

### Frontend (devopsita-fe)
```
src/pages/Introduction.tsx   # Homepage with 6 courses
src/pages/TypingCourse.tsx   # Typing lessons overview  
src/pages/TypingLesson.tsx   # Individual typing practice
src/pages/Courses.tsx        # Full course catalog (9 courses)
src/pages/Login.tsx          # Authentication
.cursorrules                 # Frontend-specific rules
ARCHITECTURE.md              # Frontend architecture
```

### Backend (devopsita-be)  
```
main.go                      # Go HTTP server with JWT
README.md                    # Backend documentation
```

### Infrastructure (devopsita-infra)
```
local-test/                  # Docker Compose development
amplify.yml                  # AWS Amplify build config
AWS_DEPLOYMENT_GUIDE.md      # Deployment instructions
.cursorrules                 # Multi-repo rules
ARCHITECTURE.md              # Full system architecture
CONTEXT.md                   # Project decisions & history
```

## Key Project Rules

### Course System
- **Homepage**: Exactly 6 courses in order: Touch Typing → Programming → DSA → Cloud Computing → DevOps → Cybersecurity
- **Only Touch Typing available** with "Start" button
- **Course levels**: Foundation (green), Intermediate (blue), Advanced (orange)
- **Full catalog**: 9 courses total on separate /courses page

### Navigation Flow
```
Homepage → "Begin now" → /typing (course overview)
Homepage → "Explore Courses" → /courses (full catalog)
Touch Typing card → "Start" → /typing (course overview)
Typing course → "Start Typing" → /typing/lesson/1
```

### Development Workflow
```bash
# Full stack local development
cd devopsita-infra/local-test
./start-dev.sh

# Frontend only
cd devopsita-fe  
npm start

# Backend only
cd devopsita-be
go run main.go
```

### Common Tasks
- **Add new course**: Update Introduction.tsx and Courses.tsx
- **Modify typing lessons**: Edit TypingCourse.tsx and TypingLesson.tsx
- **Change navigation**: Update App.tsx routes
- **Deploy to AWS**: Follow AWS_DEPLOYMENT_GUIDE.md

### User Preferences
- **Commit style**: Conventional (feat/fix/refactor) with short messages
- **No automatic commits**: User controls timing
- **Parallel tool execution**: Preferred when possible
- **Simple explanations**: Direct action over lengthy descriptions

## Quick Debugging
- **Frontend not starting**: Check you're in devopsita-fe directory
- **Backend connection issues**: Verify Go service on port 8080
- **Docker problems**: Check Docker Desktop running, try ./stop-dev.sh then ./start-dev.sh
- **Route issues**: Check App.tsx for routing configuration

## Architecture Patterns
- **Components**: Functional React with hooks
- **Styling**: Tailwind CSS with custom theme
- **State**: React hooks + localStorage for progress
- **Types**: TypeScript strict mode
- **API**: Axios for HTTP, JWT for auth

## Recent Major Changes
1. Added DSA, DevOps, Cloud Computing courses
2. Reduced homepage to 6 specific courses  
3. Added "Start" button to Touch Typing
4. Implemented typing lesson progress tracking
5. Created comprehensive documentation for context

## When in Doubt
1. Check .cursorrules in current repository
2. Reference ARCHITECTURE.md for technical details
3. Review CONTEXT.md for product decisions
4. Look at existing components for patterns
5. Ask user for clarification on preferences

This guide should provide enough context for any AI assistant to effectively contribute to the DevOpsita project across all repositories.
