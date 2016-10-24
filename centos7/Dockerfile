FROM centos:7
MAINTAINER Jayson Ge <gyj3023@foxmail.com>

COPY ./docker.repo /etc/yum.repos.d/docker.repo

RUN yum update -y && \
    yum install -y docker-engine

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# Define additional metadata for our image.
VOLUME /var/lib/docker
CMD ["wrapdocker"]
