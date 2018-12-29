# PascalCoin-Docker
Dockerfile for PascalCoin

We expose JSON-RPC at port 4003

## Build

```
docker build -t pascalcoin:4.0.1 .
```

## Run

```
mkdir -p data/Data
# (Optional) download latest BlockChainStream_*.zip from https://sourceforge.net/projects/pascalcoin/files/ and extract to ./data/Data
#   wget https://downloads.sourceforge.net/project/pascalcoin/BlockChainStream_268000.zip -O blocks.zip
#   unzip blocks.zip -d ./data/Data/
docker run --rm -itd --name ipasc -p 0.0.0.0:4003:4003 -v `pwd`/data:/root/PascalCoin pascalcoin
```

## Persist data

By using [CWSpear/local-persist](https://github.com/CWSpear/local-persist):

```
curl -fsSL https://raw.githubusercontent.com/CWSpear/local-persist/master/scripts/install.sh | sudo bash
docker volume create -d local-persist -o mountpoint=/data/pasc-data --name=pasc-data
```

## Using pre-built docker image

Using automated build image from <https://hub.docker.com/r/mixhq/pascalcoin/>:

```
docker run --rm -itd --name ipasc -p 0.0.0.0:4003:4003 -v pasc-data:/root/PascalCoin/data mixhq/pascalcoin
```
