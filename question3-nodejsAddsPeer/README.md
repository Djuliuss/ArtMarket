# Question 3.3 - NodeJS adds Peer

This folder contains the implementation for Question 3.3.
To find further information aboupt how configtxlator is used to add the new Org, read document configtxlator.txt.

For simplicity's sake, I have not included the steps to get Fabric CA (question 2.5). Following the steps on this page will create the network without Fabric CA certificates. If you wish to add them, you will need to follow the steps on the README.md file in Question 2-CA.


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
- ./copyCerts.sh   
- access folder app/certs and copy the value of sk key. Edit the copyCerts.sh script and paste the value of the key on the last line and comment it out. 
- run again ./copyCerts.sh , this time with the last line uncommented.
- cd app/certs 
- edit file Org3Admin and update fields signingIdentity and certificate with the values of the certificates.
- cd ..
- npm install
- node app.js
- open browser and access localhost:4000
- click on the button Add Peer. 
- IMPORTANT! BEFORE YOU CAN INVOKE THE CHAINCODE ON ORG3 YOU WILL NEED TO RUN ./deployChaincode2.sh TO DEPLOY AND INSTATIATE THE CHAINCODE IN ORG3.

