FROM ubuntu:18.04

WORKDIR /opt
VOLUME /root/PascalCoin
EXPOSE 4003 4004

RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/PascalCoin/PascalCoin/releases/download/4.0.1/PascalCoin_4.0.1_Ubuntu_64b_Binaries.tar.gz -O - | tar --strip-components 1 -xzf -

RUN rm -rf /var/lib/apt/lists/*
COPY ./entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
