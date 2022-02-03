FROM nginx:alpine
WORKDIR /app 
ADD . /app
CMD ["/index.html"]
LABEL color=red
