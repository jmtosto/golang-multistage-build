FROM golang:alpine as build

WORKDIR /app

COPY . .

RUN go mod download
RUN go build -o /app main.go

ENTRYPOINT ["go", "run", "main.go"]

FROM scratch

COPY --from=build /app /app

ENTRYPOINT ["/app"]