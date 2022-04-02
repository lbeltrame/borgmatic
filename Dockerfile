FROM alpine:latest

RUN apk add --no-cache borgmatic openssh

CMD ["borgmatic", "--stats", "-v" ,"0"]
