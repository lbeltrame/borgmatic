FROM alpine:latest

RUN apk add --no-cache borgmatic

CMD ["borgmatic", "--stats", "-v" ,"0"]
