FROM golang:1.16.4-buster

RUN apt-get update && apt-get -uy upgrade
RUN apt-get -y install ca-certificates \
    && update-ca-certificates
RUN git clone -b v1.8.3 https://github.com/coredns/coredns.git /src 
RUN cd /src \
    && go get github.com/wealdtech/coredns-ens@v1.3.1 \
    && go get github.com/zhoreeq/coredns-meshname \
    && go mod download

# NOTE: direct copying to /src/plugin.cfg doesn't work for some reason
COPY plugin.cfg /plugin.cfg 
RUN cd /src && cat /plugin.cfg > plugin.cfg && make SHELL='sh -x' CGO_ENABLED=1

FROM debian:stable-slim

COPY Corefile /Corefile
COPY --from=0 /etc/ssl/certs /etc/ssl/certs
COPY --from=0 /src/coredns /vapordns

EXPOSE 53 53/udp
EXPOSE 853
EXPOSE 443
ENTRYPOINT ["/vapordns"]
