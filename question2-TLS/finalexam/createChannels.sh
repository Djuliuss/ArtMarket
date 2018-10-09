#!/bin/bash

# we have to include the tls flag and teh ca certificate
docker exec cli.Org1 bash -c 'peer channel create -c test -f ./channels/Test.tx -o orderer.finalexam.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/finalexam.com/orderers/orderer.finalexam.com/msp/tlscacerts/tlsca.finalexam.com-cert.pem'

docker exec cli.Org1 bash -c 'peer channel join -b test.block'
docker exec cli.Org2 bash -c 'peer channel join -b test.block'

docker exec cli.Org1 bash -c 'peer channel update -o orderer.finalexam.com:7050 -c test -f ./channels/Org1anchor.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/finalexam.com/orderers/orderer.finalexam.com/msp/tlscacerts/tlsca.finalexam.com-cert.pem'
docker exec cli.Org2 bash -c 'peer channel update -o orderer.finalexam.com:7050 -c test -f ./channels/Org2anchor.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/finalexam.com/orderers/orderer.finalexam.com/msp/tlscacerts/tlsca.finalexam.com-cert.pem'
