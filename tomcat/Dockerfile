FROM centos:latest
MAINTAINER minj "mminjjie@gmail.com"
LABEL version="v1" description="web server" by="tomcat"

#environment
ENV CATALINA_HOME=/usr/local/tomcat
ENV JAVA_HOME=/usr/local/jdk-11.0.7
ENV PATH=$JAVA_HOME/bin:$PATH
ENV CLASSPATH=$JAVA_HOME/lib:$CLASSPATH

#copy tomcat.tar.gz and jdk-11.0.7.tar.gz
ADD /src/* /usr/local/
COPY docker-entrypoint.sh /usr/local/bin/

#Configure java and tomcat environment
RUN /usr/bin/chmod +x /usr/local/bin/docker-entrypoint.sh ;\
    mkdir /tmp/tomcat ;\
    mv /usr/local/apache-tomcat-9.0.35 /usr/local/tomcat

VOLUME ["/tmp/tomcat"]

EXPOSE 8080

CMD ["/usr/local/bin/docker-entrypoint.sh"]
