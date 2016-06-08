# docker-statsd

This image provides a Statsd server with a [Librato](https://librato.com) backend.

## Running this image

The config file is `/opt/statsd/config.js`, for now the only way of modifying it
is via volume mount.

    docker run -v custom-config.js:/opt/statsd/config.js -p 8125:8125/udp

## Sample config

The default config will output everything to the console, in order to use the
Librato integration you can use the following config as an example:

    {
      librato: {
        email: "",
        token: "",
        source: "",
        postTimeoutSecs: 10
      },
      deleteIdleStats: true,
      port: 8125,
      backends: [ "./backends/console", "statsd-librato-backend" ]
    }
