FROM mysql:5.7.32
MAINTAINER minj "mminjjie@gmail.com"
LABEL version="5.7" description="mysql xtrabackup" by="mysql5.7.32"
  
#docker run -d -p 3307:3306 \
#-v /path/data:/opt/mysql/data \
#-v /path/conf:/etc/mysql/conf.d \
#-e MYSQL_ROOT_PASSWORD=root \
#--name xtrabackup xtrabackup:5.7

ADD qpress-11-linux-x64.tar /opt/.

RUN mkdir -p /var/log/mysql && \
    chown -R mysql.mysql /var/log/mysql && \
    chmod 775 /opt/qpress* && mv /opt/qpress* /usr/bin/.
    
RUN apt-get update && \
    apt-get install -y wget gnupg2 lsb-release curl && \
    wget https://repo.percona.com/apt/percona-release_latest.$(lsb_release -sc)_all.deb && \
    dpkg -i percona-release_latest.buster_all.deb
    
RUN apt-get update && \
    apt-get -y install percona-xtrabackup-24

