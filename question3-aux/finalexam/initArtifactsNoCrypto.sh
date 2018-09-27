#!/bin/bash

sudo rm -rf orderer ; mkdir orderer

configtxgen -profile finalexamOrdererGenesis -outputBlock ./orderer/genesis.block


sudo rm -rf channels ; mkdir channels

configtxgen -profile TestChannel -outputCreateChannelTx ./channels/Test.tx -channelID test

configtxgen -profile TestChannel -outputAnchorPeersUpdate ./channels/Org1anchor.tx -channelID test -asOrg Org1MSP

configtxgen -profile TestChannel -outputAnchorPeersUpdate ./channels/Org2anchor.tx -channelID test -asOrg Org2MSP
