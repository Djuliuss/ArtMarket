#!/bin/bash

sudo rm -rf crypto-config
sudo rm -rf orderer && mkdir orderer
sudo rm -rf channels && mkdir channels

cryptogen generate --config crypto-config.yaml

configtxgen -profile PCXCHGOrdererGenesis -outputBlock ./orderer/genesis.block

configtxgen -profile AsusChannel -outputCreateChannelTx ./channels/Asus.tx -channelID asus

configtxgen -profile DellChannel -outputCreateChannelTx ./channels/Dell.tx -channelID dell

configtxgen -profile HPChannel -outputCreateChannelTx ./channels/HP.tx -channelID hp

configtxgen -profile AsusChannel -outputAnchorPeersUpdate ./channels/asusanchor.tx -channelID asus -asOrg AsusMSP

configtxgen -profile DellChannel -outputAnchorPeersUpdate ./channels/dellanchor.tx -channelID dell -asOrg DellMSP

configtxgen -profile HPChannel -outputAnchorPeersUpdate ./channels/hpanchor.tx -channelID hp -asOrg HPMSP

configtxgen -profile AsusChannel -outputAnchorPeersUpdate ./channels/amazonanchorasus.tx -channelID asus -asOrg AmazonMSP

configtxgen -profile DellChannel -outputAnchorPeersUpdate ./channels/amazonanchordell.tx -channelID dell -asOrg AmazonMSP

configtxgen -profile HPChannel -outputAnchorPeersUpdate ./channels/amazonanchorhp.tx -channelID hp -asOrg AmazonMSP
