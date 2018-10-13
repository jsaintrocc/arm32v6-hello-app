FROM arm32v6/golang:alpine as builder
ADD . /go/src/hello-app
RUN go install hello-app

FROM arm32v6/alpine:latest
COPY --from=builder /go/bin/hello-app /hello-app
ENV PORT 8080
ENTRYPOINT ["/hello-app"]
