#!/bin/bash
#Auther: Shazib Mustafa
#Created: 31-01-2022
#Description: The script is use to create image and container

echo "cloning a Docker-share repo"
rm -rf Docker_share && git clone https://github.com/shazib96/Docker_share.git/html/
FILE=./Dockerfile
PORT=5000:80
APP_NAME="mage_sh"
IMAGE_NAME=$APP_NAME:0.1
WORKDIR=/usr/share/nginx/html
#Check image exist

IMAGE_ID=$(docker images -q "${APP_NAME}")

if [ -e "$FILE" ]; then
    echo "Dockerfile exist"
fi
if [ -z "$IMAGE_ID" ]; then
    echo "Create Image from {$IMAGE_NAME}"
    docker build -t $IMAGE_NAME .
    echo "image is build.."
fi
# Get container ID and state of the Docker image
CONTAINER_ID=$(docker ps -q -a -f name="${APP_NAME}")
if [ -z "$CONTAINER_ID" ]; then
    CONTAINER_STATUS=false
    echo "Checking container Id"
else
    CONTAINER_STATUS=$(docker inspect -f {{.State.Running}} $CONTAINER_ID)
    echo " Checked docker image or container ID state"
fi
# Set arguments for Docker
if [ -z "$1" ]; then
    ARG="/bin/sh"
    echo "Checking arguments"
else
    ARG="$1"
    echo "dollar sign.."
fi

if [ -n "$CONTAINER_ID" ]; then
      docker rm -f $CONTAINER_ID
      echo "Removing container"       
fi
if [ $? -eq 0 ]; then
    docker run -d --name=$APP_NAME -p "${PORT}" -v /var/lib/jenkins/workspace/Share_docker/Docker_share/html:"${WORKDIR}" -w "${WORKDIR}" $IMAGE_NAME
    echo "Creating container"
else
    if [ CONTAINER_STATUS == "true" ]; then
        docker exec -it $CONTAINER_ID $ARG
        echo "Executing container"
    else
        docker container start $CONTAINER_ID
        echo "start the container."
    fi
fi
