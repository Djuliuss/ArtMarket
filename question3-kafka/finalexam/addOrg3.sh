#!/bin/bash

cd org3-artifacts
sudo rm -rf crypto-config
cryptogen generate --config org3-crypto.yaml
configtxgen -printOrg Org3MSP > ../channel-artifacts/org3.json
cd ..
cp -r crypto-config/ordererOrganizations org3-artifacts/crypto-config 

docker exec cli.Org1 bash -c 'apt update; apt install -y jq'
docker exec -d cli.Org1 bash -c 'configtxlator start &' 
cd /chaincode/github.com/hyperledger/fabric/peer/
sudo rm -rf co* up*
cd -
# docker exec  -d   cli.Org1 bash -c 'peer channel fetch config config_block.pb -o orderer.finalexam.com:7050 -c test'
# docker exec  -d   cli.Org1 bash -c 'curl -X POST --data-binary @config_block.pb "http://127.0.0.1:7059/protolator/decode/common.Block" | jq . > config_block.json'
# docker exec  -d   cli.Org1 bash -c 'jq .data.data[0].payload.data.config config_block.json > config.json'
# docker exec  -d   cli.Org1 bash -c 'jq -s '"'"'.[0] * {"channel_group":{"groups":{"Application":{"groups":{"Org3MSP":.[1]}}}}}'"'"' config.json ./channel-artifacts/org3.json >& updated_config.json' 
# docker exec  -d   cli.Org1 bash -c 'curl -X POST --data-binary @config.json "http://127.0.0.1:7059/protolator/encode/common.Config" > config.pb'
# docker exec  -d   cli.Org1 bash -c 'curl -X POST --data-binary @updated_config.json "http://127.0.0.1:7059/protolator/encode/common.Config" > updated_config.pb'
# docker exec  -d   cli.Org1 bash -c 'curl -X POST -F channel=test -F "original=@config.pb" -F "updated=@updated_config.pb" "http://127.0.0.1:7059/configtxlator/compute/update-from-configs" > config_update.pb'
# docker exec  -d   cli.Org1 bash -c 'curl -X POST --data-binary @config_update.pb "http://127.0.0.1:7059/protolator/decode/common.ConfigUpdate" | jq . > config_update.json'
# docker exec  -d   cli.Org1 bash -c 'echo '"'"'{"payload":{"header":{"channel_header":{"channel_id":"test","type":2}},"data":{"config_update":'"'"'$(cat config_update.json)'"'"'}}}'"'"' | jq . > config_update_in_envelope.json' 
# docker exec  -d   cli.Org1 bash -c 'curl -X POST --data-binary @config_update_in_envelope.json "http://127.0.0.1:7059/protolator/encode/common.Envelope" > config_update_in_envelope.pb'
# docker exec  -d   cli.Org1 bash -c 'peer channel signconfigtx -f config_update_in_envelope.pb'
# docker exec -d cli.Org2 bash -c 'peer channel update -f config_update_in_envelope.pb -c test -o orderer.finalexam.com:7050'

