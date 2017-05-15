FROM openjdk:8-alpine

ENV JIRA_HOME /var/atlassian/jira
ENV JIRA_INSTALL /opt/atlassian/jira
ENV JIRA_VERSION 7.0.11
ENV POSTGRES_VERSION 9.4.1212

ENV JIRA_DOWNLOAD_URL https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-${JIRA_VERSION}.tar.gz
ENV POSTGRES_DOWNLOAD_URL https://jdbc.postgresql.org/download/postgresql-${POSTGRES_VERSION}.jar

RUN set -ex && \
    apk add --update bash curl libressl su-exec tar tomcat-native && \
    mkdir -p "${JIRA_HOME}" "${JIRA_HOME}/caches/indexes" && \
    chmod -R 700 "${JIRA_HOME}" && chown -R daemon:daemon "${JIRA_HOME}" && \
    mkdir -p "${JIRA_INSTALL}/conf/Catalina" && \
    curl -Ls "${JIRA_DOWNLOAD_URL}" | tar -xz --directory "${JIRA_INSTALL}" --strip-components=1 --no-same-owner && \
    rm -f "${JIRA_INSTALL}/lib/postgresql-9.1-903.jdbc4-atlassian-hosted.jar" && \
    curl -Ls "${POSTGRES_DOWNLOAD_URL}" -o "${JIRA_INSTALL}/lib/postgresql-${POSTGRES_VERSION}.jar" && \
    cd "${JIRA_INSTALL}" && chmod -R 700 conf logs temp work && chown -R daemon:daemon conf logs temp work && \
    sed --in-place "s/java version/openjdk version/g" "${JIRA_INSTALL}/bin/check-java.sh" && \
    echo -e "\njira.home=$JIRA_HOME" >> "${JIRA_INSTALL}/atlassian-jira/WEB-INF/classes/jira-application.properties"

EXPOSE 8080

VOLUME ["/var/atlassian/jira", "/opt/atlassian/jira/logs"]

WORKDIR /var/atlassian/jira

COPY docker-jira-entrypoint.sh /
COPY server.xml /opt/atlassian/jira/conf/server.xml

ENTRYPOINT ["/docker-jira-entrypoint.sh"]

CMD ["/opt/atlassian/jira/bin/catalina.sh", "run"]