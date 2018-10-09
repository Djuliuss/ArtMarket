#!/bin/bash

# we include the TLS flag and the CA certificate
docker exec cli.Org1 bash -c "peer chaincode invoke -C test -n finalexam -c '{\"Args\":[\"transferPieceOfArt\", \"Org1001\", \"Org2\"]}' --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/finalexam.com/orderers/orderer.finalexam.com/msp/tlscacerts/tlsca.finalexam.com-cert.pem"

sleep 5

docker exec cli.Org1 bash -c "peer chaincode query -C test -n finalexam -c '{\"Args\":[\"queryPieceOfArt\", \"Org1001\"]}'"

docker exec cli.Org2 bash -c "peer chaincode query -C test -n finalexam -c '{\"Args\":[\"queryPieceOfArt\", \"Org1001\"]}'"