ARG LOGSTASH_VERSION=7.12.1
FROM docker.elastic.co/logstash/logstash:$LOGSTASH_VERSION
#USER logstash
COPY --chown=logstash:logstash ./logstash/logstash-filter-ip2region-1.0.2.zip /tmp/logstash-filter-ip2region-1.0.2.zip
RUN \
    /usr/share/logstash/bin/logstash-plugin install file:///tmp/logstash-filter-ip2region-1.0.2.zip && \
    rm -rf /tmp/logstash-filter-ip2region-1.0.2.zip
    #/usr/share/logstash/bin/logstash-plugin install logstash-output-loki
