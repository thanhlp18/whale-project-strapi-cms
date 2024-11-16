#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Variables
IMAGE_NAME="strapi-cms"
IMAGE_TAG="v1"
REPOSITORY="thanhlp188" # Replace with your Docker repository

# Login to Docker Hub
echo "Logging in to Docker Hub..."
docker login

# Remove existing builder instance if it exists
docker buildx rm mybuilder || true

# Create and use a new builder instance
docker buildx create --use --name mybuilder

# Build the Docker image and push it to the repository
docker buildx build --platform linux/amd64,linux/arm64 -t $REPOSITORY/$IMAGE_NAME:$IMAGE_TAG --push .