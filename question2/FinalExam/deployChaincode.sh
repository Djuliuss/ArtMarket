#!/bin/bash

docker exec cli.Org1 bash -c 'peer chaincode install -p finalexam -n finalexam -v 0'
docker exec cli.Org1 bash -c "peer chaincode instantiate -C test -n finalexam -v 0 -c '{\"Args\":[]}'"^C
