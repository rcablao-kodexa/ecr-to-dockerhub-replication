FROM golang:alpine3.17

RUN apk add curl jq docker python3 py3-pip aws-cli --no-cache 

RUN go install github.com/google/go-containerregistry/cmd/crane@latest

COPY scripts ./scripts

COPY replicate.py  ./

COPY entrypoint.sh  ./

RUN chmod +x -R ./scripts

RUN chmod +x replicate.py

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]