#!/bin/bash

cd org3-artifacts
cryptogen generate --config org3-crypto.yaml
configtxgen -printOrg Org3MSP > ../channel-artifacts/org3.json
cd ..

cp -r crypto-config/ordererOrganizations org3-artifacts/crypto-config 
docker exec cli.Org1 bash -c 'apt update; apt install -y jq'
docker exec -d cli.Org1 bash -c 'configtxlator start &' 
sudo rm -f /home/julio/hlf/FinalExam/question3-aux/finalexam/chaincode/github.com/hyperledger/fabric/peer/config_block.pb
docker exec -d cli.Org1 bash -c 'peer channel fetch config config_block.pb -o orderer.finalexam.com:7050 -c test'
sudo rm -f /home/julio/hlf/FinalExam/question3-aux/finalexam/chaincode/github.com/hyperledger/fabric/peer/config_block.json
docker exec -d cli.Org1 bash -c 'curl -X POST --data-binary @config_block.pb "http://127.0.0.1:7059/protolator/decode/common.Block" | jq . > config_block.json'
sudo rm -f /home/julio/hlf/FinalExam/question3-aux/finalexam/chaincode/github.com/hyperledger/fabric/peer/config.json
docker exec -d cli.Org1 bash -c 'jq .data.data[0].payload.data.config config_block.json > config.json'
sudo rm -f /home/julio/hlf/FinalExam/question3-aux/finalexam/chaincode/github.com/hyperledger/fabric/peer/updated_config.json
docker exec -d cli.Org1 bash -c 'jq -s '"'"'.[0] * {"channel_group":{"groups":{"Application":{"groups":{"Org3MSP":.[1]}}}}}'"'"' config.json ./channel-artifacts/org3.json >& updated_config.json' 