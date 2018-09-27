#!/bin/bash

cd org3-artifacts
cryptogen generate --config org3-crypto.yaml
configtxgen -printOrg Org3MSP > ../channel-artifacts/org3.json
cd ..

cp -r crypto-config/ordererOrganizations org3-artifacts/crypto-config 
docker exec cli.Org1 bash -c 'apt update; apt install -y jq'
