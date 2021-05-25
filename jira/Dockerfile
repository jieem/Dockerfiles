FROM atlassian/jira-software

USER root

# Crack software: https://gitee.com/pengzhile/atlassian-agent/releases
COPY "atlassian-agent.jar" /opt/atlassian/jira/

RUN echo 'export JAVA_OPTS="-javaagent:/path/to/atlassian-agent.jar ${JAVA_OPTS}"' >> /opt/atlassian/jira/bin/setenv.sh 
