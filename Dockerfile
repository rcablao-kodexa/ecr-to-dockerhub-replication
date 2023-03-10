FROM golang:alpine3.17

RUN apk add curl jq

COPY entrypoint.sh /entrypoint.sh

RUN go install github.com/google/go-containerregistry/cmd/crane@latest

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]