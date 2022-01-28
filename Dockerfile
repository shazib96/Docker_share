FROM nginx:alpine
WORKDIR /app 
ADD . /app
CMD ["/bin/sh","/app/index.html"]
LABEL color=red
