FROM centos:7
MAINTAINER Jayson Ge <gyj3023@foxmail.com>

COPY ./docker.repo /etc/yum.repos.d/docker.repo

RUN yum update -y && \
    yum install -y docker-engine
