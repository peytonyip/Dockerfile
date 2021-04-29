ARG kibana_version=7.12.1

FROM docker.elastic.co/kibana/kibana:$kibana_version

ARG kibana_version=7.12.1

RUN \
  /usr/share/kibana/bin/kibana-plugin install https://github.com/pjhampton/kibana-prometheus-exporter/releases/download/$kibana_version/kibanaPrometheusExporter-$kibana_version.zip