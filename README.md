# Docker

## develop
docker run -d --restart=always \
--privileged -p 22022:22 \
-v /opt/develop:/opt \
--name develop --hostname=centos \
centos:develop /usr/sbin/init

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
docker run --rm sentry config generate-secret-key \
docker-compose up -d \
docker exec -it sentry_xx sh -c "sentry upgrade" \
docker-compose restart sentry 

docker exec -it sentry_xx sh -c "sentry createuser" 

## jira
docker run --restart always \
-v /path:/var/atlassian/application-data/jira \
--name="jira" -d -p 8080:8080 jira:test

docker exec -it jira sh -c " \
java -jar atlassian-agent.jar \
-d -m test@test.com -n zhengyu \
-p jira -o http://xxx.com \
-s xx-xx-xx-xx"

## prometheus
docker-compose up -d

