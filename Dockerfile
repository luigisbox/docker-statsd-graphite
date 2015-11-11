FROM hopsoft/graphite-statsd

ADD config.js /opt/statsd/config.js

ENV GRAFANA_VERSION 2.1.3

RUN curl https://grafanarel.s3.amazonaws.com/builds/grafana_${GRAFANA_VERSION}_amd64.deb -o /tmp/grafana.deb && \
    dpkg -i /tmp/grafana.deb && \
    rm /tmp/grafana.deb

ADD grafana.sh /etc/service/grafana/run

VOLUME ["/var/lib/grafana", "/var/log/grafana", "/etc/grafana"]
VOLUME ["/opt/graphite/storage/whisper"]

EXPOSE 3000

