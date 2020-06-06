#Dockerfiles
This project is for learning.

#ssh service 
docker build -t xx:xx .
docker run -it --name ssh -p 22:22 xx:xx /bin/bash

#mysql5.7.28
docker build -t centos:mysql_v1 .
docker run -d --name mysql [--privileged=true] \
-v /tmp/mysql8.0:/tmp/mysql8.0 \
-p 3306:3306 centos:mysql_v1

#tomcat9.0.35
docker build -t centos:tomcat_v1 .
docker run -d --name tomcat \
-v /tmp/tomcat:/tmp/tomcat \
-p 8080:8080 centos:tomcat_v1
