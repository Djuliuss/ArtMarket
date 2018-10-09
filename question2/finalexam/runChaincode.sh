#!/bin/bash

# we create a few Pieces of Art in both Org1 and Org2

docker exec cli.Org1 bash -c "peer chaincode invoke -C test -n finalexam -c '{\"Args\":[\"createPieceOfArt\", \"Org1001\", \"Mona Lisa\", \"Painting\"]}'"

docker exec cli.Org1 bash -c "peer chaincode invoke -C test -n finalexam -c '{\"Args\":[\"createPieceOfArt\", \"Org1002\", \"The Scream\", \"Painting\"]}'"

docker exec cli.Org2 bash -c "peer chaincode invoke -C test -n finalexam -c '{\"Args\":[\"createPieceOfArt\", \"Org2001\", \"Happiness\", \"Picture\"]}'"

docker exec cli.Org2 bash -c "peer chaincode invoke -C test -n finalexam -c '{\"Args\":[\"createPieceOfArt\", \"Org2003\", \"Venus\", \"Vase\"]}'"

# we need to wait a few secods for the changes to be commited into the blockchain

sleep 5

# we query the blockchain to validate the records have been inserted into the blockchain correctly.
docker exec cli.Org1 bash -c "peer chaincode query -C test -n finalexam -c '{\"Args\":[\"queryPieceOfArt\", \"Org1001\"]}'"

docker exec cli.Org2 bash -c "peer chaincode query -C test -n finalexam -c '{\"Args\":[\"queryPieceOfArt\", \"Org1002\"]}'"

