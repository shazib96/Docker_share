#!/usr/bin/bash


echo "cloning a docker-share repo"
git clone https://github.com/shazib96/Docker_share.git
DIR=docker-share/Dockerfile
container_name=helloworld

if [ -f "$DIR" ]
then
printf '%s\n' "Dockerfile ($DIR)"
result=$( sudo docker images -q helloworld 
else
echo "No dockerfile found"
fi

contain=$(sudo docker ps -q )
if [[ "$?" -eq 0 ]]; then
echo "Container exist"
sudo docker rm -f helloworld
else
echo "Container not exist"

if [[ -n "$result" ]]; then
echo "image exists"
sudo docker rmi -f helloworld
else
echo "Image not exist"
fi

echo "build the docker image"
sudo docker build -t helloworld/shazib:0.1 .  
echo "built docker images and proceeding to delete existing container"
result=$( docker ps -q -f name=helloworld )

if [[ "$?" -eq 1 ]]; then
echo "Container not exist"
echo "Deploying the updated container"
sudo docker run -itd -p 3000:3000 -v .:/app --name helloworld 
#sudo docker container rm -f helloworld
echo "Deleted the existing docker container"
else
echo "No such container"
fi

