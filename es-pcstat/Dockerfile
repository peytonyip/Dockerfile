
FROM golang:alpine as builder
#FROM golang:bullseye

WORKDIR /app
RUN apk add --no-cache git bash

RUN git clone https://github.com/zhangdapao995/es-pcstat.git; \
    cd es-pcstat/es-pcstat; \
    GOOS=linux GOARCH=amd64 go build
    #chmod 755 es-pcstat

FROM scratch

WORKDIR /app

COPY --from=builder /app/es-pcstat/es-pcstat/es-pcstat /app
#COPY --from=builder /app/es-pcstat/es-pcstat/es.conf /app
COPY es.conf /app
COPY start.sh /app

ENTRYPOINT ["bash /app/start.sh"]