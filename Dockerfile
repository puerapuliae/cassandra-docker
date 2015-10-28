FROM puerapuliae/core-java:8
MAINTAINER Bjoern Klatt

# Cassandra Version
ENV VERSION 2.2.3

# Download and unarchive Cassandra
RUN echo "deb http://archive.ubuntu.com/ubuntu wily universe" | tee -a  /etc/apt/sources.list && \
    echo "deb http://debian.datastax.com/community stable main" | tee -a /etc/apt/sources.list.d/cassandra.sources.list && \
    curl -L http://debian.datastax.com/debian/repo_key | apt-key add - && \
    apt-get update && \
    apt-get install -y dsc22 && \
    service cassandra stop && \
    rm -rf /var/lib/cassandra/data/system/* && \
    apt-get clean

# Storage Port, JMX, Thrift, CQL Native, OpsCenter Agent
# Left out: SSL
EXPOSE 7000 7199 9042 9160 61621
