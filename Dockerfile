FROM nginx:alpine
WORKDIR /app 
ADD . /app
LABEL color=red
