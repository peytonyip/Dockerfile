FROM alpine:latest

ARG USER=postgres
ARG GROUP=postgres
ARG UID=1000
ARG GID=1000

RUN set -eux; \
    addgroup -g ${GID} -S ${GROUP}; \
    adduser  -u ${UID} -S -D -G ${GROUP} -s /bin/bash ${USER}; \
    mkdir -p /app/{data,scripts}; \
    chown ${UID}:${GID} /app

ENV LANG en_US.utf8

RUN \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories; \
    apk add --no-cache postgresql-client tini


USER ${USER}

WORKDIR /app

#COPY --chown=${UID}:${GID} backup_db.sh /app/scripts/

ENTRYPOINT ["/sbin/tini", "--"]