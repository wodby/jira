FROM openjdk:8-jre-alpine

ENV JIRA_HOME /var/atlassian/jira
ENV JIRA_INSTALL /opt/atlassian/jira
ENV JIRA_VERSION 7.3.6
ENV PG_JDBC_VER 9.4.1212

ENV GOTLP_VER 0.1.5
ENV GOTPL_URL https://github.com/wodby/gotpl/releases/download/${GOTLP_VER}/gotpl-alpine-linux-amd64-${GOTLP_VER}.tar.gz

ENV JIRA_DOWNLOAD_URL https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-${JIRA_VERSION}.tar.gz
ENV PG_JDBC_DOWNLOAD_URL https://jdbc.postgresql.org/download/postgresql-${PG_JDBC_VER}.jar

RUN set -ex && \
    apk add --update bash curl libressl make su-exec tar tomcat-native && \
    mkdir -p "${JIRA_HOME}" "${JIRA_HOME}/caches/indexes" && \
    chmod -R 700 "${JIRA_HOME}" && chown -R daemon:daemon "${JIRA_HOME}" && \
    mkdir -p "${JIRA_INSTALL}/conf/Catalina" && \
    curl -Ls "${JIRA_DOWNLOAD_URL}" | tar -xz --directory "${JIRA_INSTALL}" --strip-components=1 --no-same-owner && \
    rm -f "${JIRA_INSTALL}/lib/postgresql-9.1-903.jdbc4-atlassian-hosted.jar" && \
    curl -Ls "${PG_JDBC_DOWNLOAD_URL}" -o "${JIRA_INSTALL}/lib/postgresql-${PG_JDBC_VER}.jar" && \
    cd "${JIRA_INSTALL}" && chmod -R 700 conf logs temp work && chown -R daemon:daemon conf logs temp work && \
    sed --in-place "s/java version/openjdk version/g" "${JIRA_INSTALL}/bin/check-java.sh" && \
    echo -e "\njira.home=$JIRA_HOME" >> "${JIRA_INSTALL}/atlassian-jira/WEB-INF/classes/jira-application.properties" && \
    wget -qO- ${GOTPL_URL} | tar xz -C /usr/local/bin

EXPOSE 8080

VOLUME ["/var/atlassian/jira", "/opt/atlassian/jira/logs"]

WORKDIR /var/atlassian/jira

COPY docker-entrypoint.sh /
COPY server.xml.tpl /etc/gotpl/
COPY actions /usr/local/bin/

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/opt/atlassian/jira/bin/catalina.sh", "run"]