# Docker
## ssh service 
docker build -t xx:xx .
docker run -it --name ssh -p 22:22 xx:xx /bin/bash

## mysql
docker build -t centos:mysql_v1 .
docker run -d --name mysql [--privileged=true] \
-v /opt/mysql8.0/tmp:/tmp/mysql8.0 \
-v /opt/mysql8.0/etc/my.cnf:/usr/local/mysql8.0/etc/my.cnf
-p 3306:3306 centos:mysql_v1

## tomcat9.0.35
docker build -t centos:tomcat_v1 .
docker run -d --name tomcat \
-v /tmp/tomcat:/tmp/tomcat \
-p 8080:8080 centos:tomcat_v1

## xtrabackup:5.7
docker run -d -p 3307:3306 \
-v /path/data:/opt/mysql/data \
-v /path/conf:/etc/mysql/conf.d \
-e MYSQL_ROOT_PASSWORD=root \
--name xtrabackup xtrabackup:5.7

## rocket
docker-compose up -d

## sentry
docker run --rm sentry config generate-secret-key
docker-compose up -d
docker-compose exec sentry sentry upgrade
docker-compose restart sentry
