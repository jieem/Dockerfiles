FROM centos:latest
MAINTAINER minj "mminjjie@gmail.com"

#Update yum source
RUN mv /etc/yum.repos.d/CentOS-Base.repo \
    /etc/yum.repos.d/CentOS-Base.repo.backup; \
    curl -o /etc/yum.repos.d/CentOS-Base.repo \
    https://mirrors.aliyun.com/repo/Centos-8.repo; \
    yum clean all ; yum makecache

#Install dependent software
#libxml2-devel pcre-devel openssl-devel expat-devel python-devel
RUN yum -y install gcc* make
