
# Start from the official Node.js LTS base image
# Use slimmer version
FROM node:18-slim

# Add labels
LABEL org.opencontainers.image.source=https://github.com/twonines/Bible-Beasts-Project/
LABEL org.opencontainers.image.description="Bible Beast Project Submission"

# Instructions to add NR agent to docker: https://docs.newrelic.com/docs/apm/agents/nodejs-agent/installation-configuration/install-nodejs-agent-docker

# Add the time to the build
RUN date -u +"%Y-%m-%dT%H:%M:%SZ" > /build-time.txt

# Set the working directory to /app
WORKDIR /app

# Copy the dependency files to the working directory
COPY . .

# Install project dependencies
RUN npm install

# Build the Next.js app
RUN npm run build

# Expose port 3000 for the Next.js app to be accessible
EXPOSE 3000

# Start the Next.js app
CMD ["npm", "start"]