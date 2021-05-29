# vapordns

vapordns is a cloud native DNS server with advanced privacy features and decentralized domain names support.

vapordns can:

- Secure all your regular DNS queries with [DNS-over-TLS](https://en.wikipedia.org/wiki/DNS_over_TLS)
- Resolve cool [ens.domains](https://ens.domains/) with the use of **BLOCKCHAIN TECHNOLOGY**
- Supports the [meshname](https://github.com/zhoreeq/meshname) decentralized naming system
- Can work as an authoritative server for your domains

## Usage

See `DOCKER_TIPS.md`

## Configuration

vapordns is a special build of CoreDNS.
See `Corefile` for example vapordns configuration file.

For more information read the [CoreDNS docs](https://coredns.io/manual/toc/#configuration).

## Features

### DNS-over-TLS

### Ethereum naming system aka BLOCKCHAIN domains

### Meshname

## Yggdrasil support

To enable Yggdrasil's IPv6 in Docker containers read [this](https://docs.docker.com/config/daemon/ipv6/)
