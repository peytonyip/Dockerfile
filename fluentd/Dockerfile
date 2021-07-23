#ARG FLUENTD_VERSION=v1.9-1
#FROM fluentd:${FLUENTD_VERSION}
FROM fluentd

# install plugin
USER root

RUN fluent-gem install fluent-plugin-grafana-loki && \
    fluent-gem install fluent-plugin-elasticsearch && \
    fluent-gem install fluent-plugin-redis && \
    fluent-gem install fluent-plugin-prometheus

USER fluent
