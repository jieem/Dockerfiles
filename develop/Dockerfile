FROM centos:latest
MAINTAINER minj "mminjjie@gmail.com"
LABEL version="8.0" description="develop tool" by="centos8"
  
#podman run -d --restart=always \
#--privileged -p 22022:22 \
#-v /opt/develop:/opt \
#--name develop --hostname=centos \
#centos:develop /usr/sbin/init

#manual configuration items: 
#vim plug, passwd of develop, .ssh

#Install dependent software
RUN dnf -y install gcc.x86_64 gcc-c++.x86_64 make cmake clang && \
    dnf -y install python38.x86_64 python38-devel.x86_64 && \
    dnf -y install lrzsz zip git wget && \
    dnf -y install ncurses ncurses-devel && \
    dnf -y install openssh-server passwd.x86_64

#install vim
RUN mkdir /usr/local/vim && \
    wget -P /usr/local/src/ https://github.com/vim/vim/archive/v8.2.2374.tar.gz && \
    cd /usr/local/src/ && tar xf v8.2.2374.tar.gz && \
    cd /usr/local/src/vim-8.2.2374 && ./configure --prefix=/usr/local/vim \
    --with-features=huge --enable-multibyte --enable-cscope \
    --enable-gui=gtk2 --enable-python3interp=yes \
    --with-python-config-dir=/usr/lib64/python3.8/config-3.8-x86_64-linux-gnu && \
    make && make install && \
    ln -s /usr/local/vim/bin/* /usr/local/bin/.

#install go
RUN mkdir -p /usr/local/go && \
    wget -P /usr/local/src/ https://golang.org/dl/go1.16.2.linux-amd64.tar.gz && \
    cd /usr/local/src/ && tar xf go1.16.2.linux-amd64.tar.gz && \
    mv /usr/local/src/go /usr/local/go/go116 && \
    ln -s /usr/local/go/go116/bin/* /usr/local/bin/. && \
    echo -e "\n#golang\nexport GOROOT=/usr/local/go/go116" >> /etc/profile && \
    echo -e "export GOPATH=\$HOME/.go\nexport GOBIN=\$HOME/bin\n" >> /etc/profile

#install nodejs
RUN wget -P /usr/local/src/ https://nodejs.org/dist/v14.16.0/node-v14.16.0-linux-x64.tar.xz && \
    cd /usr/local/src/ && tar xf node-v14.16.0-linux-x64.tar.xz && \
    mv /usr/local/src/node-v14.16.0-linux-x64 /usr/local/node && \
    echo -e "#node\nexport NODE_HOME=/usr/local/node" >> /etc/profile && \
    source /etc/profile && \
    rm -rf /usr/local/src/* && \
    npm config set registry https://registry.npm.taobao.org && \
    npm install -g yarn && \
    ln -s /usr/local/node/bin/* /usr/local/bin/.

#expose port
EXPOSE 22 80 443

VOLUME /opt

CMD /usr/sbin/init
