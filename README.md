# Dockerfiles
This project is for learning.

#ssh service 
docker build -t xx:xx .
docker run -it --name ssh -p 22:22 xx:xx /bin/bash

#mysql5.7.28
docker build -t centos:mysql_v1 .
docker run -d --name msyql \
-v /tmp/mysql8.0:/tmp/mysql8.0 \
-p 3306:3306 \
centos:mysql_v1

