#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
  set -x
fi

chown daemon:daemon /var/atlassian/jira

if [[ -n "${CONFLUENCE_HOST}" ]]; then
    jre="/usr/lib/jvm/java-8-openjdk-amd64/jre"

    if [[ -z "${CONFLUENCE_PORT}" ]]; then
        CONFLUENCE_PORT=443
    fi

    url="${CONFLUENCE_HOST}:${CONFLUENCE_PORT}"
    openssl s_client -connect "${url}"  < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /tmp/cert.pem
    "${jre}/bin/keytool" -import -alias confluence -trustcacerts -keystore "${jre}/lib/security/cacerts" -file /tmp/cert.pem
    rm /tmp/cert.pem
fi

gosu daemon /docker-entrypoint.sh "${@}"
