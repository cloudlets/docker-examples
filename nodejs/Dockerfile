# Define base image
FROM node:12-slim

# Create and set working directory to /app
WORKDIR /app

# Set /app owner to node:node
RUN chown -R node:node /app

# Switch to user node. All following statements will be executed by this user.
USER node

# Copy package*.json and yarn.lock from your project root to /app in container.
COPY --chown=node:node package*.json yarn.lock ./

# Install dependencies with yarn.
RUN yarn install --production

# Copy all files from project root to /app in container
COPY --chown=node:node . .

# Set environment variable to production.
ENV NODE_ENV=production

# Start yarn server.
CMD [ "yarn", "run", "start" ]