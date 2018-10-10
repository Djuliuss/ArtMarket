# Question 3 - Kafka

This folder contains the implementation for Question 3.4 
The steps are the sames as in folder Question 3. The scripts and files have been modified to include Kafka parameters.


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
