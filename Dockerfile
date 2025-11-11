# Use official Node.js 18 Alpine image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies (production only)
RUN npm ci --only=production

# Copy all app files
COPY . .

# Expose port 8080 (used by your app)
EXPOSE 8080

# Start the app
CMD ["npm", "start"]
