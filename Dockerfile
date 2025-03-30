FROM golang:1.24.1 AS builder

WORKDIR /app
COPY src/ .

RUN go build -o server

FROM golang:1.24.1

WORKDIR /app
COPY --from=builder /app/server .

CMD ["/app/server"]

