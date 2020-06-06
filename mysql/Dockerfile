FROM centos:latest
MAINTAINER minj "mminjjie@gmail.com"
LABEL version="v1" description="database" by=“mysql8.0.18”

#Update yum source
RUN mv /etc/yum.repos.d/CentOS-Base.repo \
    /etc/yum.repos.d/CentOS-Base.repo.backup; \
    curl -o /etc/yum.repos.d/CentOS-Base.repo \
    https://mirrors.aliyun.com/repo/Centos-8.repo; \
    yum clean all ; yum makecache

#Set environment variables
ARG mysqlDir=/usr/local/mysql8.0
ARG logDir=/var/log/mysql8.0

#Copy mysql compressed package
#ADD url /usr/local/mysql8.0/
ADD /src/mysql-8.0* ${mysqlDir}

#Create a basic environment
RUN /usr/sbin/useradd -s /usr/sbin/nologin mysql ; \
    mkdir -p ${mysqlDir}/data/3306 ${mysqlDir}/etc/ ; \
    mkdir -p ${logDir}/3306 ; \
    mv ${mysqlDir}/mysql-8.0* ${mysqlDir}/mysql 

RUN /usr/bin/chown -R mysql.mysql ${mysqlDir}/mysql ; \
    /usr/bin/chown -R mysql.mysql ${mysqlDir}/data ${logDir} ; \
    ln -s ${mysqlDir}/mysql/bin/* /usr/local/bin/ ; \
    yum -y install libaio-devel numactl libncurses*

#add my.cnf
ADD /etc/my.cnf ${mysqlDir}/etc/

#Initialize the database.
RUN /usr/local/bin/mysqld --initialize-insecure --user=mysql \
    --basedir=${mysqlDir}/mysql --datadir=${mysqlDir}/data/3306

#volume
VOLUME ["/tmp/mysql8.0"]

EXPOSE 3306

#mysql startup script
ADD /etc/docker-entrypoint.sh /usr/local/bin/
RUN /usr/bin/chmod +x /usr/local/bin/docker-entrypoint.sh

CMD ["/usr/local/bin/docker-entrypoint.sh"]

