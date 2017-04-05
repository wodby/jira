FROM cptactionhank/atlassian-jira:7.2.7

COPY docker-jira-entrypoint.sh /
COPY server.xml /opt/atlassian/jira/conf/server.xml

ENTRYPOINT ["/docker-jira-entrypoint.sh"]

CMD ["/opt/atlassian/jira/bin/catalina.sh", "run"]