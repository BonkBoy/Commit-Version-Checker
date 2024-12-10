FROM alpine:latest

RUN apk --update --no-cache add git jq

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]