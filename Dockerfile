FROM ubuntu:14.04

MAINTAINER Andrzej Raczkowski <araczkowski@gmail.com>

ARG PASSWORD
ENV PASSWORD ${PASSWORD:-secret}

# get rid of the message: "debconf: unable to initialize frontend: Dialog"
ENV DEBIAN_FRONTEND noninteractive
ENV ORACLE_HOME /u01/app/oracle/product/11.2.0/xe
ENV PATH $ORACLE_HOME/bin:$PATH
ENV ORACLE_SID=XE

EXPOSE 22 1521 8080

# all installation files
COPY files /files
COPY scripts /scripts

# store the configuration outside from container
VOLUME /u01

# ENTRYPOINT
ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
