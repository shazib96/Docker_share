#!/bin/bash
#Auther: Shazib Mustafa
#Created: 31-01-2022
#Description: The script is use to create image and container

echo "cloning a Docker-share repo"
rm -rf Docker_share && git clone https://github.com/shazib96/Docker_share.git
FILE=Docker_share/Dockerfile
PORT=5000:5000
APP_NAME="image_sh"
IMAGE_NAME=$APP_NAME:0.1
WORKDIR=/app
#Check image exist

IMAGE_ID=$(docker images -q "${APP_NAME}")

if [ -e "$FILE" ]; then
    echo "Dockerfile exist"
fi
if [ -z "$IMAGE_ID" ]; then
    echo "Create Image from {$IMAGE_NAME}"
    docker build -t $IMAGE_NAME .
fi

# Get container ID and state of the Docker image
CONTAINER_ID=$(docker ps -q -a -f name="${APP_NAME}")
if [ -z "$CONTAINER_ID" ]; then
    CONTAINER_STATUS=false
else
    CONTAINER_STATUS=$(docker inspect -f {{.State.Running}} $CONTAINER_ID)
fi

# Set arguments for Docker
if [ -z "$1" ]; then
    ARG="/bin/sh"
else
    ARG="$1"
fi

if [ -z "$CONTAINER_ID" ]; then
    docker run -it --rm --name=$APP_NAME -p "${PORT}" -n default -v '.':"${WORKDIR}" -w "${WORKDIR}" $IMAGE_NAME $ARG
else
    if [ CONTAINER_STATUS == "true" ]; then
        docker exec -it $CONTAINER_ID $ARG
    else
        docker container start -ai $CONTAINER_ID
    fi
fi
