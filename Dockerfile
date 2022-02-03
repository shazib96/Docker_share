FROM nginx:alpine
WORKDIR /app 
ADD . /app
CMD ["/bin/sh","/app"]
LABEL color=red
