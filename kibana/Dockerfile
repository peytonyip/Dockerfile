ARG KIBANA_VERSION=8.1.0

FROM docker.elastic.co/kibana/kibana:${KIBANA_VERSION}

ARG KIBANA_VERSION

RUN \
  /usr/share/kibana/bin/kibana-plugin install https://github.com/pjhampton/kibana-prometheus-exporter/releases/download/${KIBANA_VERSION}/kibanaPrometheusExporter-${KIBANA_VERSION}.zip