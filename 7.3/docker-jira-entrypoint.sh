#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
  set -x
fi

chown daemon:daemon /var/atlassian/jira

gosu daemon /docker-entrypoint.sh "${@}"
