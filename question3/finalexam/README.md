# Question 3

This folder contains the implementation for Question 3.1 
To find further information aboupt how configtxlator is used to add the new Org, read document configtxlator.txt.

For simplicity's sake, I have not included the steps to get Fabric CA (question 2.5). Following the steps on this page will create the network without Fabric CA certificates. If you wish to add them, you will need to follow the steps on the README.md file in Question 2-CA folder and then instead of running initArtifacts.sh run initArtifactsNoCrypto.sh

## To set up the network and add Org3

Execute the following steps, in the same order

- ./initArtifacts.sh  (it will generate crypto material for Org3, too)
- ./up.sh
- ./createChannels.sh
- ./deployChaincode.sh
- ./runChaincode.sh
- docker exec -it cli.Org1 bash
- inside the docker container, run script "./script.sh". (This script will prepare the transaction with the configuration update.)
	(Important: sometimes you need to run the script twice because some of the steps are executed too fast.)
- exit the container and enter the other one with 'docker exec -it cli.Org2 bash"
- inside the docker container, run script "./script2.sh". This script will submit the update transaction to the orderer.
- exit the container
- docker-compose -f docker-compose-org3.yaml up -d
- ./joinNetwork.sh   (This will script will join Org3 to the network, deploy chaincode and invoke it)
