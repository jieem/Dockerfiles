# Dockerfiles
This project is for learning.

#ssh service 
docker build -t xx:xx .
docker run -it --name ssh -p 22:22 xx:xx /bin/bash

#mysql5.7.28
docker build -t centos:mysql_v1 .
docker run -d --name msyql \
-v /opt/mysql5.7/data/:/usr/local/mysql5.7/data/ \
-v /opt/mysql5.7/log:/var/log/mysql5.7 \
-v /opt/mysql5.7/etc:/usr/local/mysql5.7/etc \
-v /opt/mysql5.7/tmp:/usr/local/mysql5.7/tmp \
-p 3306:3306 \
centos:mysql_v1

