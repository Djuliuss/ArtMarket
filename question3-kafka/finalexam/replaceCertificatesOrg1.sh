#!/bin/bash

# channel and genesis block
sudo cp ./Org1CA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/msp/admincerts/Admin@Org1.com-cert.pem

sudo cp ./Org1CA/fabric-ca-client/msp/cacerts/ca-Org1-7054.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/msp/cacerts/ca.Org1.com-cert.pem

# admin User
sudo cp ./Org1CA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/users/Admin@Org1.com/msp/admincerts/Admin@Org1.com-cert.pem

sudo cp ./Org1CA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/users/Admin@Org1.com/msp/signcerts/Admin@Org1.com-cert.pem

sudo cp ./Org1CA/fabric-ca-client/msp/cacerts/ca-Org1-7054.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/users/Admin@Org1.com/msp/cacerts/ca.Org1.com-cert.pem

sudo rm -rf /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/users/Admin@Org1.com/msp/keystore

sudo cp ./Org1CA/fabric-ca-client/msp/keystore /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/users/Admin@Org1.com/msp -r

docker exec admin-client bash -c 'fabric-ca-client register --id.name peer0 --id.type peer --id.affiliation org1.department1 --id.secret peerpw'

docker exec admin-client bash -c 'fabric-ca-client enroll -u http://peer0:peerpw@ca.Org1:7054 -M peer0.Org1.com'

docker exec admin-client bash -c 'fabric-ca-client register --id.name peer1 --id.type peer --id.affiliation org2.department1 --id.secret peerpw'

docker exec admin-client bash -c 'fabric-ca-client enroll -u http://peer1:peerpw@ca.Org1:7054 -M peer1.Org1.com'


# peer certificates
sudo cp ./Org1CA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/peers/peer0.Org1.com/msp/admincerts/Admin@Org1.com-cert.pem

sudo cp ./Org1CA/fabric-ca-client/peer0.Org1.com/cacerts/ca-Org1-7054.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/peers/peer0.Org1.com/msp/cacerts/ca.Org1.com-cert.pem

sudo rm -rf /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/peers/peer0.Org1.com/msp/keystore

sudo cp ./Org1CA/fabric-ca-client/peer0.Org1.com/keystore /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/peers/peer0.Org1.com/msp -r 

sudo cp ./Org1CA/fabric-ca-client/peer0.Org1.com/signcerts/cert.pem  /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/peers/peer0.Org1.com/msp/signcerts/peer0.Org1.com-cert.pem


sudo cp ./Org1CA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/peers/peer1.Org1.com/msp/admincerts/Admin@Org1.com-cert.pem

sudo cp ./Org1CA/fabric-ca-client/peer1.Org1.com/cacerts/ca-Org1-7054.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/peers/peer1.Org1.com/msp/cacerts/ca.Org1.com-cert.pem

sudo rm -rf /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/peers/peer1.Org1.com/msp/keystore

sudo cp ./Org1CA/fabric-ca-client/peer1.Org1.com/keystore /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/peers/peer1.Org1.com/msp -r 

sudo cp ./Org1CA/fabric-ca-client/peer1.Org1.com/signcerts/cert.pem  /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org1.com/peers/peer1.Org1.com/msp/signcerts/peer1.Org1.com-cert.pem



