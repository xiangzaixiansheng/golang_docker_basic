FROM ubuntu:latest

MAINTAINER xiangzaixiansheng@163.com  golang_basic
ENV TZ=Asia/Shanghai

# use --build-arg GO_VERSION=<version>
# ARG GO_VERSION
# ENV GO_VERSION=${GO_VERSION}

ENV GO_VERSION=1.18.9

RUN apt-get update
RUN apt-get install -y wget git gcc
RUN wget -P /tmp "https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz"

RUN tar -C /usr/local -xzf "/tmp/go${GO_VERSION}.linux-amd64.tar.gz"
RUN rm "/tmp/go${GO_VERSION}.linux-amd64.tar.gz"

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"


WORKDIR $GOPATH