# Usage

Create a directory for the volume on your local machine, e.g. `/data/elasticsearch`.

On the command line, run
```
docker run \
	-p 9200:9200 \
	-v /data/elasticsearch:/usr/share/elasticsearch/data
	-d \
	bluespice/elasticsearch:lastest
```

# Troubleshooting

If the container does not start with message like

```
max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
```

you need to run
```
sysctl -w vm.max_map_count=262144
```

and restart the `docker` service.

You can also persist this setting in the `/etc/sysctl.conf` file, so make sure it survives a reboot.

See also https://stackoverflow.com/questions/51445846/elasticsearch-max-virtual-memory-areas-vm-max-map-count-65530-is-too-low-inc
