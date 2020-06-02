FROM centos:latest
MAINTAINER minj "mminjjie@gmail.com"

RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup; \
    curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-8.repo; \
    yum clean all ; yum makecache
RUN yum -y install openssh-server openssh-clients
RUN echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config ; \
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' ;\
    mkdir /var/run/sshd

EXPOSE 22

CMD /usr/sbin/sshd -D
