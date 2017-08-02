# JIRA Software Docker Container Image

[![Build Status](https://travis-ci.org/wodby/jira.svg?branch=master)](https://travis-ci.org/wodby/jira)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/jira.svg)](https://hub.docker.com/r/wodby/jira)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/jira.svg)](https://hub.docker.com/r/wodby/jira)
[![Wodby Slack](http://slack.wodby.com/badge.svg)](http://slack.wodby.com)

## Docker Images

Images are built via [Travis CI](https://travis-ci.org/wodby/jira) and published on [Docker Hub](https://hub.docker.com/r/wodby/jira). 

## Versions

| JIRA Software                                                      | Alpine Linux |
| ------------------------------------------------------------------ | ------------ |
| [7.4.2](https://github.com/wodby/jira/tree/master/7.4/Dockerfile)  | 3.6          |
| [7.3.8](https://github.com/wodby/jira/tree/master/7.3/Dockerfile)  | 3.6          |
| [7.2.10](https://github.com/wodby/jira/tree/master/7.2/Dockerfile) | 3.6          |
| [7.1.10](https://github.com/wodby/jira/tree/master/7.1/Dockerfile) | 3.6          |
| [7.0.11](https://github.com/wodby/jira/tree/master/7.0/Dockerfile) | 3.4          |

## Environment Variables

| Variable        | Default Value | Description |
| --------------- | ------------- | ----------- |
| JIRA_HTTPS      |               |             |
| CONFLUENCE_HOST |               |             |
| CONFLUENCE_PORT | 443           |             |

## Deployment

Deploy Jira Software stack to your server via [![Wodby](https://www.google.com/s2/favicons?domain=wodby.com) Wodby](https://cloud.wodby.com/stackhub/6e9cb42d-f306-4fbf-baba-f30184c22483/overview).
