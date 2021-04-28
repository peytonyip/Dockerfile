ARG logstash_version=7.12.1
FROM docker.elastic.co/logstash/logstash:$logstash_version


ENV buildDeps="wget"
ENV filterVersion="1.0.2"

#USER root

RUN \
    #rm -rf /var/cache/yum/* &&\
    #yum makecache && \
    #yum update -y && yum install -y $buildDeps && \
    #cd /tmp && \
    #wget -O logstash-filter-ip2region-"$filterVersion".zip "https://github.com/liangwenrong/ip2region-my/releases/latest/download/logstash-filter-ip2region-${filterVersion}.zip" && \
    #/usr/share/logstash/bin/logstash-plugin install file:///tmp/logstash-filter-ip2region-"$filterVersion.zip" && \
    ./bin/logstash-plugin install https://github.com/liangwenrong/ip2region-my/releases/latest/download/logstash-filter-ip2region-${filterVersion}.zip
    #rm -rf /tmp/logstash-filter-ip2region-"$filterVersion.zip" && \
    #rpm -e --nodeps $buildDeps && \
    #yum clean all

#USER logstash
