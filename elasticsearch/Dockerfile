ARG ES_VERSION=8.4.1

FROM docker.elastic.co/elasticsearch/elasticsearch:${ES_VERSION}

ARG ES_VERSION


USER elasticsearch

RUN \
  mkdir /tmp/ik; \
  curl -fsSL https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v${ES_VERSION}/elasticsearch-analysis-ik-${ES_VERSION}.zip -o /tmp/ik/elasticsearch-analysis-ik.zip; \
  cd /tmp/ik; \
  unzip ./elasticsearch-analysis-ik.zip; \
  rm -rf elasticsearch-analysis-ik.zip; \
  cd /tmp; \
  mv ./ik /usr/share/elasticsearch/plugins/.



#USER elasticsearch