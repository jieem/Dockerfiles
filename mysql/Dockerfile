FROM centos:latest
MAINTAINER minj "mminjjie@gmail.com"

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
    mv ${mysqlDir}/mysql-5.7.28-linux-glibc2.12-x86_64 ${mysqlDir}/mysql ; \

#add my.cnf
ADD /etc/my.cnf ${mysqlDir}/etc/

#Initialize the database.
RUN chown -R mysql.mysql ${mysqlDir}/mysql ; \
    chown -R ${mysqlDir}/data/ ${logDir} ; \
    ln -s ${mysqlDir}/mysql/bin/* /usr/local/bin/ ; \
    yum -y install libaio-devel numactl libncurses*
RUN mysqld --initialize --user=mysql --basedir=${mysqlDir}/mysql \
    --datadir=${mysqlDir}/data/3306

#volume
VOLUME ["${mysqlDir}/data","${logDir}","${mysqlDir}/etc"]

EXPOSE 3306

