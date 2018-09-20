#!/bin/bash

docker exec cli.Org1 bash -c 'peer channel create -c test -f ./channels/Test.tx -o orderer.FinalExam.com:7050'

docker exec cli.Org1 bash -c 'peer channel join -b test.block'
docker exec cli.Org2 bash -c 'peer channel join -b test.block'

docker exec cli.Org1 bash -c 'peer channel update -o orderer.FinalExam.com:7050 -c test -f ./channels/Org1anchor.tx'
docker exec cli.Org2 bash -c 'peer channel update -o orderer.FinalExam.com:7050 -c test -f ./channels/Org2anchor.tx'
