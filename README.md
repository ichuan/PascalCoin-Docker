# PascalCoin-Docker
Dockerfile for PascalCoin

We expose JSON-RPC at port 4003

## Build

```
docker build -t pascalcoin .
```

## Run

```
mkdir -p data/Data
# (Optional) download latest BlockChainStream_*.zip from https://sourceforge.net/projects/pascalcoin/files/ and extract to ./data/Data
#   wget https://downloads.sourceforge.net/project/pascalcoin/BlockChainStream_268000.zip -O blocks.zip
#   unzip blocks.zip -d ./data/Data/
# (Optional) set RPC_WHITELIST
docker run --rm -itd --name ipasc -e "RPC_WHITELIST=127.0.0.1;172.17.0.1" -p 4003:4003 -v `pwd`/data:/root/PascalCoin pascalcoin
```


## Using pre-built docker image

Using automated build image from <https://hub.docker.com/r/mixhq/pascalcoin/>:

```
docker run --rm -itd --name ipasc -e "RPC_WHITELIST=127.0.0.1;172.17.0.1" -p 4003:4003 -v `pwd`/data:/root/PascalCoin mixhq/pascalcoin
```
