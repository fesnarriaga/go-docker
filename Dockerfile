FROM golang:alpine AS build
WORKDIR /go/src/app
COPY main.go .
RUN go mod init app
RUN CGO_ENABLED=0 go build -o /go/bin/app

FROM gcr.io/distroless/static-debian12
COPY --from=build /go/bin/app /
ENTRYPOINT [ "/app" ]