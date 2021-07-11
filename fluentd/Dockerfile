FROM fluentd:latest

# install plugin
RUN fluent-gem install fluent-plugin-grafana-loki && \
    fluent-gem install fluent-plugin-elasticsearch && \
    fluent-gem install fluent-plugin-redis && \
    fluent-gem install fluent-plugin-prometheus