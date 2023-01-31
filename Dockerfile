FROM golang:alpine as build

WORKDIR /app

COPY . .

RUN go mod download
RUN go build -o app

FROM scratch

WORKDIR /app

COPY --from=build /app .

ENTRYPOINT ["./app"]