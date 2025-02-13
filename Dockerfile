FROM alpine:latest

COPY base/ /

RUN apk add --no-cache runit spamassassin tzdata gnupg perl-socket6 && \
    find /etc/service/ -type f -name run -exec chmod 754 {} \; && \
    find /etc/periodic/ -type f -exec chmod 774 {} \; && \
    chmod 700 /init.sh

EXPOSE 783

VOLUME  /var/lib/spamassassin

ENV DNS_CHECKS=0
ENV INTERNAL_NETWORKS=""
ENV TRUSTED_NETWORKS=""

HEALTHCHECK --interval=5s --start-period=15s --timeout=1s --start-interval=1s \
    CMD netstat -ltn | grep -c 783

CMD ["/init.sh"]
