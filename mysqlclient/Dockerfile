FROM alpine:latest
RUN \
    apk add --no-cache mysql-client tini

ARG user=mysql
ARG group=mysql
ARG uid=1000
ARG gid=1000


RUN \
    addgroup -g ${gid} ${group} && \
    adduser  -u ${uid} -G ${group} -s /bin/bash -D ${user} && \
    mkdir -p /app/{data,scripts} && \
    chown ${uid}:${gid} /app

USER ${user}
WORKDIR /app

#COPY --chown=${uid}:${gid} backup_db.sh /app/scripts/

ENTRYPOINT ["/sbin/tini", "--"]
#CMD ["mysql", "--version"]