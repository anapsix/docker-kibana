FROM gliderlabs/alpine:3.2
ENV KIBANA_VERSION 4.1.1
RUN apk upgrade --update && \
    apk add wget tar nodejs && \
    wget --no-check-certificate https://download.elastic.co/kibana/kibana/kibana-$KIBANA_VERSION-linux-x64.tar.gz -O /tmp/kibana-$KIBANA_VERSION-linux-x64.tar.gz && \
    [ -d /app ] && rm -r /app || true && \
    tar -C /tmp -xzf /tmp/kibana-$KIBANA_VERSION-linux-x64.tar.gz && \
    mv /tmp/kibana-$KIBANA_VERSION-linux-x64 /app && \
    rm -r /tmp/* && \
    apk del --purge wget tar
RUN sed -i 's/NODE=.*/NODE=$(which node)/g' /app/bin/kibana
COPY ./docker-entrypoint.sh /entrypoint.sh
EXPOSE 5601
ENTRYPOINT ["/entrypoint.sh"]
CMD ["kibana"]

