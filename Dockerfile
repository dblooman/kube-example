FROM golang:1.12
WORKDIR /opt/build
ADD go.mod go.sum /opt/build/
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o example

FROM alpine:latest
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*

COPY --from=0 /opt/build/example .

EXPOSE 8080

CMD ["./example"]