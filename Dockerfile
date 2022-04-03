FROM alpine:latest

ARG POSTGRES_VERSION

RUN apk add --no-cache borgmatic openssh postgresql${POSTGRES_VERSION}-client

CMD ["borgmatic", "--stats", "-v" ,"0"]
