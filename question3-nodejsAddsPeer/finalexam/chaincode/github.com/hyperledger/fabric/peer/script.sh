#!/bin/bash

apt update; apt install -y jq
configtxlator start & 
sudo rm -rf co* up*
peer channel fetch config config_block.pb -o orderer.finalexam.com:7050 -c test
sleep 3
curl -X POST --data-binary @config_block.pb "http://127.0.0.1:7059/protolator/decode/common.Block" | jq . > config_block.json
jq .data.data[0].payload.data.config config_block.json > config.json
jq -s '.[0] * {"channel_group":{"groups":{"Application":{"groups":{"Org3MSP":.[1]}}}}}' config.json ./channel-artifacts/org3.json >& updated_config.json 
curl -X POST --data-binary @config.json "http://127.0.0.1:7059/protolator/encode/common.Config" > config.pb
sleep 3
curl -X POST --data-binary @updated_config.json "http://127.0.0.1:7059/protolator/encode/common.Config" > updated_config.pb
sleep 3
curl -X POST -F channel=test -F "original=@config.pb" -F "updated=@updated_config.pb" "http://127.0.0.1:7059/configtxlator/compute/update-from-configs" > config_update.pb
sleep 3
curl -X POST --data-binary @config_update.pb "http://127.0.0.1:7059/protolator/decode/common.ConfigUpdate" | jq . > config_update.json
sleep 3
echo '{"payload":{"header":{"channel_header":{"channel_id":"test","type":2}},"data":{"config_update":'$(cat config_update.json)'}}}' | jq . > config_update_in_envelope.json 
curl -X POST --data-binary @config_update_in_envelope.json "http://127.0.0.1:7059/protolator/encode/common.Envelope" > config_update_in_envelope.pb
sleep 3
peer channel signconfigtx -f config_update_in_envelope.pb
