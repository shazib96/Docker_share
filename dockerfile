FROM ubuntu:latest
WORKDIR /app
ADD . /app
RUN apt update
EXPOSE 8001
CMD /app/index.html
LABEL color=red
