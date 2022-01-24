FROM nginx:alpine
WORKDIR /app
ADD . /app
CMD /app/index.html
LABEL color=red
