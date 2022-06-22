FROM alpine

RUN apk update && \
    apk upgrade && \
    apk add git && \
    rm -vrf /var/cache/apk/*

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
