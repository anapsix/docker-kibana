#!/bin/sh

set -e

[ -e /opt/kibana/optimize ] && chmod 777 /opt/kibana/optimize || true

# Add kibana as command if needed
if [[ "$1" == -* ]]; then
  set -- /opt/kibana/bin/kibana "$@"
fi

# Run as user "nobody" if the command is "kibana"
if [ "$1" = 'kibana' ]; then
  shift 1
  if [ "$ELASTICSEARCH_URL" -o "$ELASTICSEARCH_PORT_9200_TCP" ]; then
    : ${ELASTICSEARCH_URL:='http://elasticsearch:9200'}
    sed -ri "s!^(\#\s*)?(elasticsearch[\._]url:).*!\2 '$ELASTICSEARCH_URL'!" /opt/kibana/config/kibana.yml
  else
    echo >&2 'warning: missing ELASTICSEARCH_PORT_9200_TCP or ELASTICSEARCH_URL'
    echo >&2 '  Did you forget to --link some-elasticsearch:elasticsearch'
    echo >&2 '  or -e ELASTICSEARCH_URL=http://some-elasticsearch:9200 ?'
    echo >&2
  fi
  
  set -- gosu nobody /opt/kibana/bin/kibana "$@"
fi

exec "$@"
