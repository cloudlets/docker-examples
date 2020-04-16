# Build stage: use node base image for building the artifact.
FROM node:10 as build

# Set working directory
WORKDIR /usr/src/app

# Copy package*.json to working directory in container.
COPY package*.json ./

# Install dependencies with yarn
RUN yarn

# Copy all files to container working directory
COPY . .

# Create production build with yarn
RUN yarn run build --profile

# Production stage: Use nginx base image
FROM nginx:1.17-alpine

# Copy the artifact created during build-stage
COPY --from=builder /usr/src/app/build /usr/share/nginx/html

# Copy nginx-default.conf to /etc/nginx/conf.d/default.conf in container
COPY ./nginx-default.conf /etc/nginx/conf.d/default.conf

# Expose container on port 80.
EXPOSE 80

# Copy entrypoint script to container. 
COPY docker-entrypoint.sh docker-entrypoint.sh

# Entrypoint script will be executed everytime your container starts.
ENTRYPOINT [ "./docker-entrypoint.sh" ]