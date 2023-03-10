FROM golang:alpine3.17

RUN apk add curl jq docker python3 py3-pip aws-cli --no-cache 

RUN go install github.com/google/go-containerregistry/cmd/crane@latest

COPY scripts ./scripts

RUN chmod +x -R ./scripts

ENTRYPOINT ["python replicate.py"]