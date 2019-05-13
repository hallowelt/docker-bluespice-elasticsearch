FROM alpine:3.9

RUN apk add --no-cache openjdk8
RUN adduser -D -u 1000 elasticsearch

WORKDIR /opt
RUN  wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-oss-6.3.2.tar.gz; \
	tar xf elasticsearch-oss-6.3.2.tar.gz; \
	rm elasticsearch-oss-6.3.2.tar.gz; \
	mv elasticsearch-6.3.2 elasticsearch

USER elasticsearch
RUN /opt/elasticsearch/bin/elasticsearch-plugin install --batch ingest-attachments

EXPOSE "9200"

CMD [ "/opt/elasticsearch/bin/elasticsearch" ]
