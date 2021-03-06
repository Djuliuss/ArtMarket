#!/bin/bash

# we create the channel called test using the artifact generated by configtxgen
docker exec cli.Org1 bash -c 'peer channel create -c test -f ./channels/Test.tx -o orderer.finalexam.com:7050'

# we the the Clients to join the test channel.
docker exec cli.Org1 bash -c 'peer channel join -b test.block'
docker exec cli.Org2 bash -c 'peer channel join -b test.block'

# we generate the anchor peer update transactions
docker exec cli.Org1 bash -c 'peer channel update -o orderer.finalexam.com:7050 -c test -f ./channels/Org1anchor.tx'
docker exec cli.Org2 bash -c 'peer channel update -o orderer.finalexam.com:7050 -c test -f ./channels/Org2anchor.tx'
