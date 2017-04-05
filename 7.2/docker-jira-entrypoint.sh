#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
  set -x
fi

chown -R daemon:daemon /var/atlassian/jira

exec /docker-entrypoint.sh "${@}"
