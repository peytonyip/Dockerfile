FROM docker.elastic.co/logstash/logstash:7.12.0
#COPY ./logstash/logstash-filter-ip2region-1.0.2.zip /tmp/

ENV buildDeps='wget'
USER root

RUN \
    #buildDeps='wget' && \
    rm -rf /var/cache/yum/* &&\
    yum makecache && \
    yum update -y && yum install -y $buildDeps
    
RUN cd /tmp && \
    wget -O logstash-filter-ip2region-1.0.2.zip "https://github.com/liangwenrong/ip2region-my/releases/latest/download/logstash-filter-ip2region-1.0.2.zip" && \
    /usr/share/logstash/bin/logstash-plugin install file:///tmp/logstash-filter-ip2region-1.0.2.zip && \
    rm -rf /tmp/logstash-filter-ip2region-1.0.2.zip

RUN rpm -e --nodeps $buildDeps && \
    yum clean all

USER logstash