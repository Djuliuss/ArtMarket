#!/bin/bash

# channel and genesis block
cp ./Org1CA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/msp/admincerts/Admin@Org1.com-cert.pem

cp ./Org1CA/fabric-ca-client/msp/cacerts/ca-Org1-7054.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/msp/cacerts/ca.Org1.com-cert.pem

# admin User
cp ./Org1CA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/users/Admin@Org1.com/msp/admincerts/Admin@Org1.com-cert.pem

cp ./Org1CA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/users/Admin@Org1.com/msp/signcerts/Admin@Org1.com-cert.pem

cp ./Org1CA/fabric-ca-client/msp/cacerts/ca-Org1-7054.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/users/Admin@Org1.com/msp/cacerts/ca.Org1.com-cert.pem

rm -rf /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/users/Admin@Org1.com/msp/keystore

cp ./Org1CA/fabric-ca-client/msp/keystore /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/users/Admin@Org1.com/msp -r


# peer certificates
cp ./Org1CA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/peers/peer0.Org1.com/msp/admincerts/Admin@Org1.com-cert.pem

cp ./Org1CA/fabric-ca-client/peer0.Org1.com/cacerts/ca-Org1-7054.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/peers/peer0.Org1.com/msp/cacerts/ca.Org1.com-cert.pem

rm -rf /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/peers/peer0.Org1.com/msp/keystore

cp ./Org1CA/fabric-ca-client/peer0.Org1.com/keystore /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/peers/peer0.Org1.com/msp -r 

cp ./Org1CA/fabric-ca-client/peer0.Org1.com/signcerts/cert.pem  /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/peers/peer0.Org1.com/msp/signcerts/peer0.Org1.com-cert.pem

