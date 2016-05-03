FROM registry.access.redhat.com/rhel7:latest
#FROM base-centos7:latest

ENV SQUID_CACHE_DIR=/var/spool/squid \
    SQUID_LOG_DIR=/var/log/squid

RUN set -x \
    && yum -y install squid gettext socat lsof strace\
    && yum -y update \
    && yum -y clean all \
    && chown -R 1001:1001 /etc/squid \
    && chown -R 1001:1001 /var/log/squid \
    && chmod -R 777 /var/log/squid \
    && chmod 777  /var/run/ \
    && mkdir /data \
    && chmod 777 /data

USER 1001

RUN squid -v

EXPOSE 8080/tcp

COPY containerfiles/ /

#ENTRYPOINT ["/docker-entrypoint.sh"]

#ENTRYPOINT ["/usr/sbin/squid"]
#CMD ["-f","/etc/squid/squid.conf","-N"]

CMD ["/bin/sh","-c","while true; do echo hello world; sleep 30; done"]
