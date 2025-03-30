FROM golang:1.24.1 AS builder

WORKDIR /app
COPY . .

RUN go build -o server

FROM golang:1.24.1

WORKDIR /
COPY --from=builder /app/server .

CMD ["/server"]

