# Question 2-TLS

This folder contains the implementation for Questions 2.6

For simplicity, I have not included the steps to get Fabric CA (question 2.5). Following the steps on this page will create the network without Fabric CA certificates. If you wish to add them, you will need to follow the steps on the README.md file in Question 2-CA folder and then instead of running initArtifacts.sh run initArtifactsNoCrypto.sh

## To set up the network

Execute the following scripts, in the same order

- ./initArtifacts.sh		
- ./up.sh
- ./createChannels.sh
- ./deployChaincode.sh

## To run the chaincode

Execute the following scripts, in the same order

- ./runChaincode.sh     (to create a few Pieces of Art)
- ./runChaincode2.sh   (to transfer ownership of a Piece of Art)