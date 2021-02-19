ARG RELEASE=buster
FROM debian:${RELEASE}

ARG RELEASE
ARG VERSION=4.0.6.0

ADD https://github.com/gridcoin-community/Gridcoin-Research/releases/download/${VERSION}/gridcoinresearchd_${VERSION}_${RELEASE}-1_amd64.deb .
RUN apt-get update && apt-get install -y \
        ./gridcoinresearchd_${VERSION}_${RELEASE}-1_amd64.deb \
    && rm gridcoinresearchd_${VERSION}_${RELEASE}-1_amd64.deb \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/bin/gridcoinresearchd"]
CMD ["-printtoconsole", "-investor", "-rpcallowip=127.0.0.1", "-rpcuser=rpcuser", "-rpcpassword=rpcpassword"]
EXPOSE 15715
