#!/bin/bash

docker exec cli.Org3 bash -c 'peer channel fetch 0 test.block -o orderer.finalexam.com:7050 -c test'

docker exec cli.Org3 bash -c 'peer channel join -b test.block'

docker exec cli.Org3 bash -c 'peer chaincode install -p finalexam -n finalexam -v 1'

docker exec cli.Org1 bash -c 'peer chaincode install -p finalexam -n finalexam -v 1'

docker exec cli.Org2 bash -c 'peer chaincode install -p finalexam -n finalexam -v 1'

docker exec cli.Org1 bash -c "peer chaincode upgrade -C test -n finalexam -v 1 -c '{\"Args\":[]}'"

sleep 10

docker exec cli.Org3 bash -c "peer chaincode invoke -C test -n finalexam -c '{\"Args\":[\"createPieceOfArt\", \"Org3001\", \"David\", \"Sculpture\"]}'"

sleep 10

docker exec cli.Org3 bash -c "peer chaincode query -C test -n finalexam -c '{\"Args\":[\"queryPieceOfArt\", \"Org3001\"]}'"
