ARG LOGSTASH_VERSION=7.14.2
FROM docker.elastic.co/logstash/logstash:$LOGSTASH_VERSION

RUN \
  curl -fsSL https://github.com/liangwenrong/ip2region-my/releases/latest/download/logstash-filter-ip2region-1.0.2.zip -o /tmp/logstash-filter-ip2region.zip && \
  /usr/share/logstash/bin/logstash-plugin install file:///tmp/logstash-filter-ip2region.zip && \
  rm -rf /tmp/logstash-filter-ip2region.zip 

#RUN /usr/share/logstash/bin/logstash-plugin install logstash-output-loki
