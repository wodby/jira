# JIRA Software docker container image

[![Build Status](https://travis-ci.org/wodby/jira.svg?branch=master)](https://travis-ci.org/wodby/jira)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/jira.svg)](https://hub.docker.com/r/wodby/jira)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/jira.svg)](https://hub.docker.com/r/wodby/jira)
[![Wodby Slack](http://slack.wodby.com/badge.svg)](http://slack.wodby.com)

## Supported tags and respective `Dockerfile` links:

- [`7.3`, `latest` (*7.3/Dockerfile*)](https://github.com/wodby/jira/tree/master/7.3/Dockerfile)
- [`7.2`, (*7.2/Dockerfile*)](https://github.com/wodby/jira/tree/master/7.2/Dockerfile)
- [`7.1`, (*7.1/Dockerfile*)](https://github.com/wodby/jira/tree/master/7.1/Dockerfile)
- [`7.0`, (*7.0/Dockerfile*)](https://github.com/wodby/jira/tree/master/7.0/Dockerfile)

## Actions

Usage:
```
make COMMAND [params ...]

commands:
    check-ready [host max_try wait_seconds]
 
default params values:
    host localhost
    max_try 1
    wait_seconds 1
    delay_seconds 1
```

Examples:

```bash
# Wait for Jira to start
docker exec -ti [ID] make check-ready max_try=12 wait_seconds=5 delay_seconds=20 -f /usr/local/bin/actions.mk
```

## Using in production

Deploy Jira Software container to your server via [![Wodby](https://www.google.com/s2/favicons?domain=wodby.com) Wodby](https://wodby.com).
