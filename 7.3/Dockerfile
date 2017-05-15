FROM cptactionhank/atlassian-jira-software:7.3.6

USER root

RUN apt-get install gosu

COPY docker-jira-entrypoint.sh /
COPY server.xml /opt/atlassian/jira/conf/server.xml

ENTRYPOINT ["/docker-jira-entrypoint.sh"]

CMD ["/opt/atlassian/jira/bin/catalina.sh", "run"]