#!/bin/bash

echo "Check channel info"
docker exec peer1.org1.example.com peer channel getinfo -c ebenezer

echo "Copy Chaincode to Cli container"
docker cp accessChaincode.tar.gz cli:/opt/gopath/src/github.com/hyperledger/fabric/peer/

# echo "Package chaincode"
# docker exec cli peer lifecycle chaincode package accessChaincode.tar.gz --path github.com/chaincode/accessChaincode/go --label access_1

echo "Install chaincode"
docker exec cli peer lifecycle chaincode install accessChaincode.tar.gz

docker exec -e CORE_PEER_ADDRESS=peer0.org1.example.com:7051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt cli peer lifecycle chaincode install accessChaincode.tar.gz

echo "Approve chaincode"
docker exec cli peer lifecycle chaincode approveformyorg --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem --channelID ebenezer --name access --version 1 --init-required --sequence 1 --waitForEvent --package-id access_1:0cf0fe53426746c7db1eee2619923607c376e564ba76a200ed39d90b416a4dad

echo "Check Commit readiness"
docker exec cli peer lifecycle chaincode checkcommitreadiness --channelID ebenezer --name access --version 1 --init-required --sequence 1 --output json

echo "Commit chaincode"
docker exec cli peer lifecycle chaincode commit -o orderer.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt --channelID ebenezer --name access --version 1 --sequence 1 --init-required

echo "Query commit"
docker exec cli peer lifecycle chaincode querycommitted --channelID ebenezer --name access --output json

echo "Invoke (init)"
docker exec cli peer chaincode invoke -o orderer.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt -C ebenezer -n access --isInit -c '{"Args":["name","EBENEZER CHINYATI"]}'

echo "Invoke (set)"
docker exec cli peer chaincode invoke -o orderer.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt -C ebenezer -n access -c '{"Args":["set","name","PRALE"]}'

echo "Invoke (get)"
docker exec cli peer chaincode query -C ebenezer -n access -c '{"Args":["get","name"]}'

echo "Check value with User1"
docker exec -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/User1@org1.example.com/msp" cli peer chaincode query -C ebenezer -n access -c '{"Args":["get", "name"]}'

echo "Try setting value with User1"
docker exec -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/User1@org1.example.com/msp" cli peer chaincode query -C ebenezer -n access -c '{"Args":["set", "name", "TRACY"]}'


