#!/bin/bash

docker exec cli.Org1 bash -c "peer chaincode invoke -C test -n finalexam -c '{\"Args\":[\"transferPieceOfArt\", \"Org1001\", \"Org2\"]}'"

sleep 5

docker exec cli.Org1 bash -c "peer chaincode query -C test -n finalexam -c '{\"Args\":[\"queryPieceOfArt\", \"Org1001\"]}'"

docker exec cli.Org2 bash -c "peer chaincode query -C test -n finalexam -c '{\"Args\":[\"queryPieceOfArt\", \"Org1001\"]}'"