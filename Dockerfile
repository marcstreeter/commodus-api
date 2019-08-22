FROM golang:1.12.7-buster as builder
LABEL maintainer="Marc Streeter <mstreeter@gmai.com>"
ENV GO111MODULE=auto
WORKDIR /app
RUN go mod download
COPY app .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .
FROM alpine:3.10.1
RUN apk add --no-cache ca-certificates
WORKDIR /root/
COPY --from=builder /app/main .

EXPOSE 8080

CMD ["./main"]