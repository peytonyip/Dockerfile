FROM gravitl/builder:latest as builder
# add glib support daemon manager
WORKDIR /app

ENV GO111MODULE=auto

RUN apk add --no-cache git; \
    git clone https://github.com/gravitl/netmaker.git; \
    mv netmaker/* .; \
    echo "start build"; \
    GOOS=linux GOARCH=amd64 CGO_ENABLED=0 /usr/local/go/bin/go build -ldflags="-w -s" -o netclient-app netclient/main.go



FROM alpine:3.14

RUN apk add gcompat iptables && mkdir -p /etc/netclient
# set the working directory
WORKDIR /root/

#COPY --from=builder /app/netclient-app /etc/netclient/netclient
COPY --from=builder /app/netclient-app /root/netclient
COPY --from=builder /app/scripts/netclient.sh .

#RUN chmod 0755 /etc/netclient/netclient && chmod 0755 netclient.sh
RUN chmod 0755 /root/netclient && chmod 0755 netclient.sh

ENTRYPOINT ["./netclient.sh"]