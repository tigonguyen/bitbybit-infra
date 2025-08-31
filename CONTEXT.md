# BiteBytes Project Context & Decision History

## Project Vision
BiteBytes is an IT skills learning platform that builds foundational technology skills progressively, starting with touch typing and advancing through comprehensive IT competencies.

## Multi-Repository Architecture
### Repository Roles
- **bitebytes-fe**: User interface and experience (React + TypeScript)
- **bitebytes-be**: Authentication and API services (Go)
- **bitebytes-infra**: Development environment and deployment orchestration

### Repository Dependencies
```
bitebytes-infra (orchestration)
├── → bitebytes-fe (frontend service)
└── → bitebytes-be (backend service)
```

## Current Development Status
### ✅ Completed Features
- **Frontend**: 6-course homepage with Touch Typing available
- **Typing System**: 8 progressive lessons with real-time feedback  
- **Authentication**: JWT-based login system
- **Local Development**: Docker Compose environment
- **Progress Tracking**: LocalStorage without login requirement
- **Responsive Design**: Mobile-first with Tailwind CSS
- **AWS Preparation**: Amplify configs and deployment guides

### 🚧 In Progress
- **Course Content**: Additional course development
- **AWS Deployment**: Frontend to Amplify (ready to deploy)
- **Progress Sync**: Backend integration for user data

### 📋 Planned Features
- **Advanced Courses**: Programming, DSA, Cloud, DevOps, Cybersecurity
- **User Profiles**: Progress tracking and achievements
- **Course Analytics**: Learning progress insights
- **Mobile App**: Native mobile experience

## Key Product Decisions

### Course Structure Decision
**Decision**: 6 courses on homepage in specific order
**Rationale**: Focused learning path without overwhelming users
**Implementation**: Touch Typing → Programming → DSA → Cloud Computing → DevOps → Cybersecurity

### Freemium Model Decision  
**Decision**: Free access to typing lessons, premium for advanced courses
**Rationale**: Lower barrier to entry, monetization through value-add
**Implementation**: "Coming Soon" for premium courses, "Start" button for free content

### Progressive Disclosure Decision
**Decision**: Start with typing, unlock complexity gradually
**Rationale**: Build confidence through achievable early wins
**Implementation**: Color-coded difficulty levels (green → blue → orange)

### Local-First Strategy
**Decision**: Progress saves locally without account requirement
**Rationale**: Immediate value, reduced friction, optional account creation
**Implementation**: LocalStorage → sync after login

## Technical Decisions

### Frontend Framework Choice
**Decision**: React with TypeScript and Tailwind CSS
**Rationale**: Strong ecosystem, type safety, rapid styling
**Trade-offs**: Bundle size vs developer experience

### Backend Architecture Choice
**Decision**: Go microservice with JWT authentication
**Rationale**: Performance, simplicity, strong typing
**Trade-offs**: Learning curve vs runtime efficiency

### Infrastructure Strategy
**Decision**: AWS serverless with local Docker development
**Rationale**: Cost efficiency, scalability, local dev consistency
**Trade-offs**: Vendor lock-in vs operational simplicity

### Database Decision (Planned)
**Decision**: DynamoDB for user data and progress
**Rationale**: Serverless compatibility, managed scaling
**Trade-offs**: NoSQL constraints vs operational overhead

## User Experience Decisions

### Immediate Start Philosophy
**Decision**: Users can start typing practice without signup
**Rationale**: Reduce friction, demonstrate value immediately
**Implementation**: "Start" button on Touch Typing card

### Visual Hierarchy Decision
**Decision**: Course level color coding (green/blue/orange)
**Rationale**: Clear difficulty progression, visual learning path
**Implementation**: Foundation → Intermediate → Advanced

### Navigation Simplicity
**Decision**: Clear, consistent navigation patterns
**Rationale**: Reduce cognitive load, improve discoverability
**Implementation**: "Begin now" → typing, "Explore Courses" → full catalog

## Development Workflow Decisions

### Repository Strategy
**Decision**: Multi-repository with infrastructure orchestration
**Rationale**: Service independence, clear boundaries
**Trade-offs**: Coordination complexity vs architectural clarity

### Commit Strategy
**Decision**: Conventional commits with user-controlled timing
**Rationale**: Clear history, user autonomy over workflow
**Implementation**: feat/fix/refactor prefixes, short messages

### Local Development Strategy  
**Decision**: Docker Compose for full-stack development
**Rationale**: Environment consistency, easy onboarding
**Implementation**: One-command startup in local-test/

## Deployment Strategy Decisions

### Phased Deployment Approach
**Phase 1**: Frontend to AWS Amplify (immediate value)
**Phase 2**: Backend to AWS Lambda (scalability)
**Phase 3**: Database integration (persistence)
**Rationale**: Incremental risk, faster time-to-market

### AWS Platform Choice
**Decision**: AWS ecosystem for production deployment
**Rationale**: Mature serverless offerings, integrated services
**Trade-offs**: Complexity vs comprehensive feature set

## Quality & Maintenance Decisions

### Documentation Strategy
**Decision**: Comprehensive context files for AI assistance
**Rationale**: Maintain development velocity across sessions
**Implementation**: .cursorrules, ARCHITECTURE.md, CONTEXT.md

### Code Quality Standards
**Decision**: TypeScript strict mode, ESLint warnings acceptable
**Rationale**: Type safety with pragmatic enforcement
**Implementation**: Compiler warnings ok, runtime errors not tolerated

### Testing Strategy (Future)
**Decision**: E2E tests for critical paths, unit tests for utilities
**Rationale**: High confidence testing with efficient resource allocation
**Implementation**: Cypress for E2E, Jest for units

## User Feedback Integration
- **Simple commit messages**: User preference for concise Git history
- **Controlled deployment**: User manages deployment timing
- **Visual improvements**: Consistent focus on UI polish
- **Performance first**: Local development speed prioritized

## Success Metrics (Planned)
- **Engagement**: Lesson completion rates
- **Retention**: Daily/weekly active users  
- **Progression**: Course advancement rates
- **Performance**: Typing speed improvements
- **Conversion**: Free to premium upgrade rates

## Risk Mitigation
- **Vendor lock-in**: AWS with containerized local development
- **Technical debt**: Documentation and architectural clarity
- **User churn**: Free value before monetization
- **Performance**: CDN and optimization strategies
- **Security**: JWT tokens, HTTPS, input validation
