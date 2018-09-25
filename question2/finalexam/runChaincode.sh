#!/bin/bash

docker exec cli.Org1 bash -c "peer chaincode invoke -C test -n finalexam -c '{\"Args\":[\"createPieceOfArt\", \"Org1001\", \"Mona Lisa\", \"Painting\"]}'"

docker exec cli.Org1 bash -c "peer chaincode invoke -C test -n finalexam -c '{\"Args\":[\"createPieceOfArt\", \"Org1002\", \"The Scream\", \"Painting\"]}'"

docker exec cli.Org2 bash -c "peer chaincode invoke -C test -n finalexam -c '{\"Args\":[\"createPieceOfArt\", \"Org2001\", \"Happiness\", \"Picture\"]}'"

docker exec cli.Org2 bash -c "peer chaincode invoke -C test -n finalexam -c '{\"Args\":[\"createPieceOfArt\", \"Org2003\", \"Venus\", \"Vase\"]}'"

docker exec cli.Org1 bash -c "peer chaincode query -C test -n finalexam -c '{\"Args\":[\"queryPieceOfArt\", \"Org1001\"]}'"

docker exec cli.Org2 bash -c "peer chaincode query -C test -n finalexam -c '{\"Args\":[\"queryPieceOfArt\", \"Org1002\"]}'"
