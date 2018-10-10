# Question 3-nodejs

This folder contains the implementation for Questions 3.2 (NodeJS)

For simplicity, I have not included the steps to get Fabric CA (question 2.5). Following the steps on this page will create the network without Fabric CA certificates. If you wish to add them, you will need to follow the steps on the README.md file in Question 2-CA.

## To set up the network and to add Org3

Execute the following scripts, in the same order

- ./initArtifacts.sh		
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

## To launch Org3 webapp

Execute the following steps:

- ./copyCerts.sh   
- access folder app/certs and copy the value of sk key. Edit the copyCerts.sh script and paste the value of the key on the last line and comment it out. 
- run again ./copyCerts.sh , this time with the last line uncommented.
- cd app/certs 
- edit file Org3Admin and update fields signingIdentity and certificate with the values of the certificates.
- cd ..
- npm install
- node app.js
- open browser and access localhost:4000 .  You can create new Pieces of Art and Transfer them to another owner.

