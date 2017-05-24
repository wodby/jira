#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

importConfluenceKeys() {
    if [[ -z "${CONFLUENCE_PORT}" ]]; then
        CONFLUENCE_PORT=443
    fi

    url="${CONFLUENCE_HOST}:${CONFLUENCE_PORT}"
    openssl s_client -connect "${url}"  < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /tmp/cert.pem
    "${JAVA_HOME}/bin/keytool" -import -alias confluence -trustcacerts -keystore "${JAVA_HOME}/lib/security/cacerts" \
        -file /tmp/cert.pem -storepass changeit -noprompt
    rm /tmp/cert.pem
}

if [[ "${1}" == 'make' ]]; then
    su-exec daemon "${@}" -f /usr/local/bin/actions.mk
else
    chown daemon:daemon /var/atlassian/jira

    gotpl "/etc/gotpl/server.xml.tpl" > "/opt/atlassian/jira/conf/server.xml"

    if [[ -n "${CONFLUENCE_HOST}" ]]; then
        importConfluenceKeys
    fi

    su-exec daemon "${@}"
fi
