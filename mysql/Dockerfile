FROM centos:latest
MAINTAINER minj "mminjjie@gmail.com"

#docker run -d -v /opt/mysql5.7/data/:/usr/local/mysql5.7/data/ \
#       -v /opt/mysql5.7/log:/var/log/mysql5.7 \
#       -v /opt/mysql5.7/etc:/usr/local/mysql5.7/etc \
#       -p 3306:3306 \
#       centos:mysql_v1

#Update yum source
RUN mv /etc/yum.repos.d/CentOS-Base.repo \
    /etc/yum.repos.d/CentOS-Base.repo.backup; \
    curl -o /etc/yum.repos.d/CentOS-Base.repo \
    https://mirrors.aliyun.com/repo/Centos-8.repo; \
    yum clean all ; yum makecache

#Set environment variables
ARG mysqlDir=/usr/local/mysql5.7
ARG logDir=/var/log/mysql5.7

#Copy mysql compressed package
#ADD url /usr/local/mysql5.7/
ADD /src/mysql-5.7.28-linux-glibc2.12-x86_64.tar.gz ${mysqlDir}

#Create a basic environment
RUN /usr/sbin/useradd -s /usr/sbin/nologin mysql ; \
    mkdir -p ${mysqlDir}/data/3306; mkdir -p ${mysqlDir}/etc/ ; \
    mkdir -p ${logDir}/3306 ; \
    mv ${mysqlDir}/mysql-5.7.28-linux-glibc2.12-x86_64 ${mysqlDir}/mysql 

RUN /usr/bin/chown -R mysql.mysql ${mysqlDir}/mysql ; \
    /usr/bin/chown -R mysql.mysql ${mysqlDir}/data ${logDir} ; \
    ln -s ${mysqlDir}/mysql/bin/* /usr/local/bin/ ; \
    yum -y install libaio-devel numactl libncurses*

#add my.cnf
ADD /etc/my.cnf ${mysqlDir}/etc/

#Initialize the database.
RUN mysqld --initialize-insecure --user=mysql --basedir=${mysqlDir}/mysql \
    --datadir=${mysqlDir}/data/3306

#volume
VOLUME ["${mysqlDir}/data","${logDir}","${mysqlDir}/etc"]

EXPOSE 3306

#mysql startup script
ADD /etc/mysqlStart.sh /usr/local/bin/
RUN /usr/bin/chmod +x /usr/local/bin/mysqlStart.sh

ENTRYPOINT /usr/local/bin/mysqlStart.sh
