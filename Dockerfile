FROM node:argon
MAINTAINER Hernandes Benevides de Sousa

ENV STATSD_VERSION 0.7.2

WORKDIR /opt

RUN wget -qO statsd.tar.gz \
    https://github.com/etsy/statsd/archive/v${STATSD_VERSION}.tar.gz && \
    tar -xzf statsd.tar.gz && \
    mv statsd-${STATSD_VERSION} statsd && \
    rm -f statsd.tar.gz

RUN cd statsd && \
    npm install statsd-librato-backend

COPY config.js /opt/statsd/config.js

EXPOSE 8125/udp

CMD ["/usr/local/bin/node", "/opt/statsd/stats.js", "/opt/statsd/config.js"]
