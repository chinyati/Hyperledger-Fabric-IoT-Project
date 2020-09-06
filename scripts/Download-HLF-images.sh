#!/bin/bash
# Download the Hyperledger ARM64 images and tag them as the default hyperledger/fabric images

# fabric-baseimage
docker pull chinyati/fabric-baseimage:arm64-0.4.20
docker tag chinyati/fabric-baseimage:arm64-0.4.20 hyperledger/fabric-baseimage:2.1
docker tag chinyati/fabric-baseimage:arm64-0.4.20 hyperledger/fabric-baseimage:latest

# fabric-baseos
docker pull chinyati/fabric-baseos:arm64-0.4.20
docker tag chinyati/fabric-baseos:arm64-0.4.20 hyperledger/fabric-baseos:2.1
docker tag chinyati/fabric-baseos:arm64-0.4.20 hyperledger/fabric-baseos:latest

# fabric-tools
docker pull chinyati/fabric-tools:arm64-2.1.0
docker tag chinyati/fabric-tools:arm64-2.1.0 hyperledger/fabric-tools:2.1
docker tag chinyati/fabric-tools:arm64-2.1.0 hyperledger/fabric-tools:latest

# orderer
docker pull chinyati/fabric-orderer:2.1
docker tag chinyati/fabric-orderer:2.1 hyperledger/fabric-orderer:2.1
docker tag chinyati/fabric-orderer:2.1 hyperledger/fabric-orderer:latest

# peer
docker pull chinyati/fabric-peer:arm64-2.1.0
docker tag chinyati/fabric-peer:arm64-2.1.0 hyperledger/fabric-peer:2.1
docker tag chinyati/fabric-peer:arm64-2.1.0 hyperledger/fabric-peer:latest

# fabric-ccenv
docker pull chinyati/fabric-ccenv:arm64-2.1.0
docker tag chinyati/fabric-ccenv:arm64-2.1.0 hyperledger/fabric-ccenv:2.1
docker tag chinyati/fabric-ccenv:arm64-2.1.0 hyperledger/fabric-ccenv:latest

# couchdb
#docker pull chinyati/fabric-couchdb:arm64-0.4.20
#docker tag chinyati/fabric-couchdb:arm64-0.4.20 hyperledger/fabric-couchdb:arm64-0.4.20
#docker tag chinyati/fabric-couchdb:arm64-0.4.20 hyperledger/fabric-couchdb:latest

# fabric-ca
#docker pull chinyati/fabric-ca:arm64-1.4.7
#docker tag chinyati/fabric-ca:arm64-1.4.7 hyperledger/fabric-ca:1.4.7
#docker tag chinyati/fabric-ca:arm64-1.4.7 hyperledger/fabric-ca:latest

# fabric-kafka
#docker pull chinyati/fabric-kafka:arm64-0.4.20
#docker tag chinyati/fabric-kafka:arm64-0.4.20 hyperledger/fabric-kafka:arm64-0.4.20
#docker tag chinyati/fabric-kafka:arm64-0.4.20 hyperledger/fabric-kafka:latest

# fabric-zookeeper
#docker pull chinyati/fabric-zookeeper:arm64-0.4.20
#docker tag chinyati/fabric-zookeeper:arm64-0.4.20 hyperledger/fabric-zookeeper:arm64-0.4.20
#docker tag chinyati/fabric-zookeeper:arm64-0.4.20 hyperledger/fabric-zookeeper:latest
