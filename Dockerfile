LABEL org.opencontainers.image.source=https://github.com/twonines/Bible-Beasts-Project/
LABEL org.opencontainers.image.description="Bible Beast Project Submission"

# Start from the official Node.js LTS base image
# use slimmer version of node
FROM node:18-slim

# Add the time to the build
RUN date -u +"%Y-%m-%dT%H:%M:%SZ" > /build-time.txt

# Set the working directory to /app
WORKDIR /app

# Copy the dependency files to the working directory
COPY . .
# COPY package.json package-lock.json /app

# cache external dependencies
# RUN --mount=type=cache,target=/var/cache/apt

# Install project dependencies
RUN npm install

# Copy the source project code
# COPY . . 

# Build the Next.js app
RUN npm run build

# Expose port 3000 for the Next.js app to be accessible
EXPOSE 3000

# Start the Next.js app
CMD ["npm", "start"]

# something to kill the app


# FROM node:18 as builder
# WORKDIR /app
# COPY package.json .
# COPY package-lock.json* .
# RUN npm install

# FROM node:8
# WORKDIR /app
# COPY --from=builder /app /app
# COPY . .
# CMD ['npm', 'start']

# to run: docker run -dp 127.0.0.1:3000:3000 bible_beasts 

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