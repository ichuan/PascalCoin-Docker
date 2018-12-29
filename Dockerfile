FROM ubuntu:18.04

WORKDIR /opt
VOLUME /root/PascalCoin
EXPOSE 4003 4004

RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/PascalCoin/PascalCoin/releases/download/4.0.1/PascalCoin_4.0.1_Ubuntu_64b_Binaries.tar.gz -O - | tar --strip-components 1 -xzf -
RUN sed -i 's/^RPC_WHITELIST=.*/RPC_WHITELIST=/g' /opt/pascalcoin_daemon.ini

RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/opt/pascalcoin_daemon", "--run"]
