FROM centos:latest
MAINTAINER shazijoiya@gmail.com
RUN yum install -y httpd\
WORKDIR /var/www/html
ADD . /var/www/html

CMD["/usr/sbin/httpd", "-D" ""FOREGROUND]
EXPOSE 80
