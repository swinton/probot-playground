#!/bin/bash

cd $( dirname "$0" )
CURRENT_DIR=$( pwd )

# Create new container
container=$( docker run --name probot-playground \
  --interactive \
  --detach \
  --volume "${CURRENT_DIR}:/build" \
  probot-playground )

# Install production dependencies
docker exec probot-playground npm install --production .

# Build the artifact
docker exec probot-playground npm run build

# Run the built artifact
docker exec probot-playground node ./dist/index.js

# Stop the container, don't wait to kill it
docker stop --time 0 probot-playground

# Remove the container
docker rm probot-playground
