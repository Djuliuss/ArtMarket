#!/bin/bash

# the following commands generate the crypto material for the orderer, Org1 and Org2.
sudo rm -rf crypto-config

cryptogen generate --config crypto-config.yaml

# the following commands generate the genesis block for the orderer.
sudo rm -rf orderer ; mkdir orderer

configtxgen -profile finalexamOrdererGenesis -outputBlock ./orderer/genesis.block


# the following commands generate the channel artifacts necessary to create the channel and the anchor peer update 
# transactions
sudo rm -rf channels ; mkdir channels

configtxgen -profile TestChannel -outputCreateChannelTx ./channels/Test.tx -channelID test

configtxgen -profile TestChannel -outputAnchorPeersUpdate ./channels/Org1anchor.tx -channelID test -asOrg Org1MSP

configtxgen -profile TestChannel -outputAnchorPeersUpdate ./channels/Org2anchor.tx -channelID test -asOrg Org2MSP
