FROM cptactionhank/atlassian-jira:7.3.4

COPY docker-jira-entrypoint.sh /
COPY server.xml /opt/atlassian/jira/conf/server.xml

USER root

RUN apt-get install gosu

ENTRYPOINT ["/docker-jira-entrypoint.sh"]

CMD ["/opt/atlassian/jira/bin/catalina.sh", "run"]