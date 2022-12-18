FROM ubuntu:16.04

MAINTAINER xiangzaixiansheng@163.com  golang_basic

# use --build-arg GO_VERSION=<version>
# ARG GO_VERSION
# ENV GO_VERSION=${GO_VERSION}

ENV GO_VERSION=1.18.9

COPY ./etc/apt/sources.list /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y wget git gcc

RUN wget -P /tmp "https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz" --user-agent="Mozilla/5.0 (X11;U;Linux i686;en-US;rv:1.9.0.3) Geco/2008092416 Firefox/3.0.3" --no-check-certificate

RUN tar -C /usr/local -xzf "/tmp/go${GO_VERSION}.linux-amd64.tar.gz"
RUN rm "/tmp/go${GO_VERSION}.linux-amd64.tar.gz"

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"


WORKDIR $GOPATH