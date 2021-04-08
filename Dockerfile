ARG RELEASE=buster
FROM debian:${RELEASE}

ARG RELEASE
ARG VERSION=5.3.1.0

ADD https://github.com/gridcoin-community/Gridcoin-Research/releases/download/${VERSION}/gridcoinresearchd_${VERSION}_${RELEASE}-1_amd64.deb .
ADD https://github.com/gridcoin-community/Gridcoin-Research/releases/download/${VERSION}/gridcoinresearchd_${VERSION}_${RELEASE}-1_amd64.deb.SHA256 .
RUN sha256sum -c gridcoinresearchd_${VERSION}_${RELEASE}-1_amd64.deb.SHA256

RUN apt-get update && apt-get install -y \
        ./gridcoinresearchd_${VERSION}_${RELEASE}-1_amd64.deb \
    && rm gridcoinresearchd_${VERSION}_${RELEASE}-1_amd64.deb \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/bin/gridcoinresearchd"]
CMD ["-printtoconsole", "-logtimestamps", "-investor", "-rpcallowip=127.0.0.1", "-rpcuser=rpcuser", "-rpcpassword=rpcpassword"]
EXPOSE 15715
