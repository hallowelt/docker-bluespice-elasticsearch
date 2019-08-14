FROM ubuntu:bionic 

ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i 's/archive.ubuntu.com/de.archive.ubuntu.com/g' /etc/apt/sources.list

RUN apt-get update
RUN apt-get -y --no-install-recommends install openjdk-8-jre-headless wget gnupg2 

RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -; \ 
    echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list; \ 
    apt-get update; \ 
    apt-get -y install elasticsearch=6.3.1; \ 
    apt-mark hold elasticsearch; \ 
    /usr/share/elasticsearch/bin/elasticsearch-plugin install -b ingest-attachment

RUN echo "#!/bin/bash \n /etc/init.d/elasticsearch start \n sleep infinity" > /opt/init.sh 
RUN chmod +x /opt/init.sh

EXPOSE "9200"

ENTRYPOINT ["/opt/init.sh"]