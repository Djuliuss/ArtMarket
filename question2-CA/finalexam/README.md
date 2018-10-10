# Question 2-CA

This folder contains the implementation for Questions 2.5 (Fabric CA)

## To generate the Fabric CA certificates

Execute the following steps, in the same order:

- cd Org1CA
- ./up.sh
- cd ..
- ./replaceCertificatesOrg1.sh
- ./killAll.sh    (ignore error messages)
- cd Org2CA
- ./up.sh
- cd ..
- ./replaceCertificatesOrg2.sh
- ./killAll.sh    (ignore error messages)

## To set up the network

Execute the following scripts, in the same order

- ./initArtifactsNoCrypto.sh		
- ./up.sh
- ./createChannels.sh
- ./deployChaincode.sh

## To run the chaincode

Execute the following scripts, in the same order

- ./runChaincode.sh     (to create a few Pieces of Art)
- ./runChaincode2.sh   (to transfer ownership of a Piece of Art)