FROM elasticsearch:6.8.23
RUN elasticsearch-plugin install -b ingest-attachment