# SpamAssassin

A SpamAssassin v4 [docker container](https://hub.docker.com/r/axllent/spamassassin)
running on Alpine Linux.

This image is designed to listen on port 783 for third-party integration, and is not a full-featured
spam solution. It was created primarily for integration with [Mailpit](https://mailpit.axllent.org).

By default all DNS checks including rDNS (reverse DNS) are disabled to vastly improve performance and 
account for local testing, however all DNS checks (including rDNS) can be enabled by adding the 
`DNS_CHECKS=1` environment variable.

Spam rules are automatically updated daily and on startup.


## Usage

```shell
docker run -d \
    -p 783:783 \
    --name spamassassin \
    axllent/spamassassin
```

To enable DNS tests:
```shell
docker run -d \
    -p 783:783 \
    -e DNS_CHECKS=1 \
    --name spamassassin \
    axllent/spamassassin
```
