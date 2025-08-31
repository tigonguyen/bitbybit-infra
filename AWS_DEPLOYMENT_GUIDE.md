# AWS Amplify Deployment Guide

## Prerequisites for AWS Amplify Deployment

### 1. AWS Account Setup
- **AWS Account**: Active AWS account with billing configured
- **IAM Permissions**: User with Amplify deployment permissions
- **Region**: Choose your preferred AWS region (e.g., us-east-1, eu-west-1)

### 2. Repository Preparation
- **GitHub Repository**: `bitbybit-fe` repository must be on GitHub
- **Repository Access**: Public repository OR GitHub personal access token for private repos
- **Build Configuration**: `amplify.yml` file in repository root (provided)

### 3. Domain Configuration (Optional)
- **Custom Domain**: Domain name purchased and managed
- **DNS Access**: Ability to configure DNS records
- **SSL Certificate**: Automatically provided by Amplify

## Step-by-Step Deployment Process

### Phase 1: Frontend Deployment (AWS Amplify)

1. **Login to AWS Console**
   - Navigate to AWS Amplify service
   - Select your preferred region

2. **Connect Repository**
   - Click "New app" → "Host web app"
   - Select "GitHub" as source
   - Authorize AWS Amplify to access your GitHub account
   - Select `bitbybit-fe` repository
   - Choose `main` branch

3. **Configure Build Settings**
   - Build settings should auto-detect React
   - Verify `amplify.yml` configuration:
     ```yaml
     version: 1
     applications:
       - frontend:
           phases:
             preBuild:
               commands:
                 - npm ci
             build:
               commands:
                 - npm run build
           artifacts:
             baseDirectory: build
             files:
               - '**/*'
           cache:
             paths:
               - node_modules/**/*
         appRoot: /
     ```

4. **Environment Variables**
   - `REACT_APP_API_BASE_URL`: Your backend API URL (set after backend deployment)
   - `REACT_APP_AUTH_SERVICE_URL`: Your auth service URL

5. **Deploy Frontend**
   - Review and deploy
   - Note the Amplify URL (e.g., `https://main.d1234567890.amplifyapp.com`)

### Phase 2: Backend Infrastructure (API Gateway + Lambda)

#### Option A: Serverless Framework (Recommended)
1. **Install Serverless Framework**
   ```bash
   npm install -g serverless
   ```

2. **Convert Go Backend to Lambda**
   - Create `serverless.yml` configuration
   - Adapt Go handlers for Lambda runtime
   - Package for deployment

#### Option B: AWS SAM (Alternative)
1. **Install AWS SAM CLI**
   - Follow [AWS SAM installation guide](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html)

2. **Create SAM Template**
   - Convert Go application to SAM template
   - Configure API Gateway routes
   - Set up DynamoDB tables

### Phase 3: Database Setup (DynamoDB)

1. **Create DynamoDB Tables**
   ```bash
   # Users table
   aws dynamodb create-table \
     --table-name BitByBit-Users \
     --attribute-definitions AttributeName=id,AttributeType=S \
     --key-schema AttributeName=id,KeyType=HASH \
     --billing-mode PAY_PER_REQUEST

   # User Progress table
   aws dynamodb create-table \
     --table-name BitByBit-Progress \
     --attribute-definitions \
       AttributeName=userId,AttributeType=S \
       AttributeName=lessonId,AttributeType=S \
     --key-schema \
       AttributeName=userId,KeyType=HASH \
       AttributeName=lessonId,KeyType=RANGE \
     --billing-mode PAY_PER_REQUEST

   # Lessons table
   aws dynamodb create-table \
     --table-name BitByBit-Lessons \
     --attribute-definitions AttributeName=id,AttributeType=S \
     --key-schema AttributeName=id,KeyType=HASH \
     --billing-mode PAY_PER_REQUEST
   ```

## Environment Variables Needed

### Frontend (AWS Amplify)
```
REACT_APP_API_BASE_URL=https://your-api-id.execute-api.region.amazonaws.com/prod
REACT_APP_AUTH_SERVICE_URL=https://your-api-id.execute-api.region.amazonaws.com/prod
```

### Backend (Lambda Environment)
```
JWT_SECRET=your-jwt-secret-key
CORS_ALLOWED_ORIGINS=https://main.d1234567890.amplifyapp.com
DYNAMODB_REGION=us-east-1
USERS_TABLE=BitByBit-Users
PROGRESS_TABLE=BitByBit-Progress
LESSONS_TABLE=BitByBit-Lessons
```

## Estimated Timeline

- **Phase 1 (Frontend)**: 30-60 minutes
- **Phase 2 (Backend)**: 2-4 hours (first time)
- **Phase 3 (Database)**: 30 minutes
- **Testing & Integration**: 1-2 hours

**Total**: 4-7 hours for complete deployment

## Cost Estimation (Monthly)

### AWS Amplify
- **Hosting**: $1-5/month
- **Build minutes**: $0.01/minute (first 1000 free)
- **Data transfer**: $0.15/GB (first 15GB free)

### API Gateway + Lambda
- **API Gateway**: $3.50/million requests
- **Lambda**: $0.20/million requests + compute time
- **Estimated**: $3-10/month for moderate usage

### DynamoDB
- **Storage**: $0.25/GB
- **Read/Write**: $1.25/$1.25 per million requests
- **Estimated**: $1-5/month for moderate usage

### **Total Estimated Monthly Cost**: $5-25

## Security Considerations

1. **Environment Variables**: Never commit secrets to Git
2. **CORS Configuration**: Limit origins to your domain
3. **API Authentication**: Implement proper JWT validation
4. **DynamoDB Access**: Use least-privilege IAM roles
5. **HTTPS Only**: Ensure all traffic uses SSL/TLS

## Monitoring & Logs

- **Amplify Console**: Build logs and deployment status
- **CloudWatch Logs**: Lambda function logs
- **API Gateway Logs**: Request/response logging
- **DynamoDB Metrics**: Read/write capacity and throttling

## Troubleshooting

### Common Issues
1. **Build Failures**: Check `amplify.yml` and `package.json`
2. **CORS Errors**: Verify backend CORS configuration
3. **Environment Variables**: Ensure all required vars are set
4. **Lambda Timeouts**: Increase timeout in function configuration

### Debugging Steps
1. Check Amplify build logs
2. Test API endpoints directly
3. Verify DynamoDB table structure
4. Review CloudWatch logs for errors
