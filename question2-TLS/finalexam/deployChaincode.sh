#!/bin/bash

docker exec cli.Org1 bash -c 'peer chaincode install -p finalexam -n finalexam -v 0'
docker exec cli.Org1 bash -c "peer chaincode instantiate -C test -n finalexam -v 0 -c '{\"Args\":[]}' --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/finalexam.com/orderers/orderer.finalexam.com/msp/tlscacerts/tlsca.finalexam.com-cert.pem"

docker exec cli.Org2 bash -c 'peer chaincode install -p finalexam -n finalexam -v 0'
docker exec cli.Org2 bash -c "peer chaincode instantiate -C test -n finalexam -v 0 -c '{\"Args\":[]}' --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/finalexam.com/orderers/orderer.finalexam.com/msp/tlscacerts/tlsca.finalexam.com-cert.pem"
