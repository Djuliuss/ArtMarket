#!/bin/bash

# channel and genesis block
cp ./Org2CA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/msp/admincerts/Admin@Org2.com-cert.pem

cp ./Org2CA/fabric-ca-client/msp/cacerts/ca-Org2-7054.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/msp/cacerts/ca.Org2.com-cert.pem

# admin User
cp ./Org2CA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/users/Admin@Org2.com/msp/admincerts/Admin@Org2.com-cert.pem

cp ./Org2CA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/users/Admin@Org2.com/msp/signcerts/Admin@Org2.com-cert.pem

cp ./Org2CA/fabric-ca-client/msp/cacerts/ca-Org2-7054.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/users/Admin@Org2.com/msp/cacerts/ca.Org2.com-cert.pem

rm -rf /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/users/Admin@Org2.com/msp/keystore

cp ./Org2CA/fabric-ca-client/msp/keystore /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/users/Admin@Org2.com/msp -r


# peer certificates
cp ./Org2CA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/peers/peer0.Org2.com/msp/admincerts/Admin@Org2.com-cert.pem

cp ./Org2CA/fabric-ca-client/peer0.Org2.com/cacerts/ca-Org2-7054.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/peers/peer0.Org2.com/msp/cacerts/ca.Org2.com-cert.pem

rm -rf /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/peers/peer0.Org2.com/msp/keystore

cp ./Org2CA/fabric-ca-client/peer0.Org2.com/keystore /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/peers/peer0.Org2.com/msp -r 

cp ./Org2CA/fabric-ca-client/peer0.Org2.com/signcerts/cert.pem  /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/peers/peer0.Org2.com/msp/signcerts/peer0.Org2.com-cert.pem

