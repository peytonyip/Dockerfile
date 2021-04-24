ENV logstash_version=7.12.0
FROM docker.elastic.co/logstash/logstash:$logstash_version
COPY ./logstash-filter-ip2region-1.0.2.zip /tmp/
RUN \
    /usr/share/logstash/bin/logstash-plugin install file:///tmp/logstash-filter-ip2region-1.0.2.zip && \
    rm -rf /tmp/logstash-filter-ip2region-1.0.2.zip