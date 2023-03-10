FROM golang:alpine3.17

RUN apk add curl jq

RUN apk add --no-cache aws-cli

RUN go install github.com/google/go-containerregistry/cmd/crane@latest

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]