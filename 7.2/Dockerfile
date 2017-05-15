FROM cptactionhank/atlassian-jira-software:7.2.7

USER root

RUN apt-get update && apt-get install gosu

COPY docker-jira-entrypoint.sh /
COPY server.xml /opt/atlassian/jira/conf/server.xml

ENTRYPOINT ["/docker-jira-entrypoint.sh"]

CMD ["/opt/atlassian/jira/bin/catalina.sh", "run"]