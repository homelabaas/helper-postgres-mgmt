FROM alpine

RUN apk update && \
    apk upgrade && \
    apk --no-cache add git postgresql-client

RUN wget https://dl.minio.io/client/mc/release/linux-amd64/mc --quiet && \
    chmod +x mc

ENTRYPOINT [ "operation.sh" ]