FROM alpine:edge

RUN apk update && \
    apk upgrade && \
    apk --no-cache add git postgresql-client

WORKDIR /bin

COPY ./mc .
COPY ./operation.sh .
RUN chmod +x /bin/operation.sh
RUN chmod +x /bin/mc

CMD [ "/bin/operation.sh" ]