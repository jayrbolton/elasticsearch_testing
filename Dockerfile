FROM openjdk:11-slim

RUN apt-get update && apt-get install -y curl && \
  cd /opt && \
  curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.5.3.tar.gz && \
  tar -xvf elasticsearch-5.5.3.tar.gz && \
  rm elasticsearch-5.5.3.tar.gz && \
  chown 1000 -R /opt/elasticsearch-5.5.3 && \
  apt-get remove -y curl

ENV PATH /opt/elasticsearch-5.5.3/bin:$PATH

CMD ["elasticsearch"]
