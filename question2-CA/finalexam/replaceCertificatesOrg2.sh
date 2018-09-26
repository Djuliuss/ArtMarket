#!/bin/bash

# channel and genesis block
sudo cp ./Org2CA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/msp/admincerts/Admin@Org2.com-cert.pem

sudo cp ./Org2CA/fabric-ca-client/msp/cacerts/ca-Org2-7054.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/msp/cacerts/ca.Org2.com-cert.pem

# admin User
sudo cp ./Org2CA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/users/Admin@Org2.com/msp/admincerts/Admin@Org2.com-cert.pem

sudo cp ./Org2CA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/users/Admin@Org2.com/msp/signcerts/Admin@Org2.com-cert.pem

sudo cp ./Org2CA/fabric-ca-client/msp/cacerts/ca-Org2-7054.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/users/Admin@Org2.com/msp/cacerts/ca.Org2.com-cert.pem

sudo rm -rf /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/users/Admin@Org2.com/msp/keystore

sudo cp ./Org2CA/fabric-ca-client/msp/keystore /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/users/Admin@Org2.com/msp -r

docker exec admin-client bash -c 'fabric-ca-client register --id.name peer0 --id.type peer --id.affiliation org2.department1 --id.secret peerpw'

docker exec admin-client bash -c 'fabric-ca-client enroll -u http://peer0:peerpw@ca.Org2:7054 -M peer0.Org2.com'

docker exec admin-client bash -c 'fabric-ca-client register --id.name peer1 --id.type peer --id.affiliation org2.department1 --id.secret peerpw'

docker exec admin-client bash -c 'fabric-ca-client enroll -u http://peer1:peerpw@ca.Org2:7054 -M peer1.Org2.com'


# peer certificates
sudo cp ./Org2CA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/peers/peer0.Org2.com/msp/admincerts/Admin@Org2.com-cert.pem

sudo cp ./Org2CA/fabric-ca-client/peer0.Org2.com/cacerts/ca-Org2-7054.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/peers/peer0.Org2.com/msp/cacerts/ca.Org2.com-cert.pem

sudo rm -rf /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/peers/peer0.Org2.com/msp/keystore

sudo cp ./Org2CA/fabric-ca-client/peer0.Org2.com/keystore /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/peers/peer0.Org2.com/msp -r 

sudo cp ./Org2CA/fabric-ca-client/peer0.Org2.com/signcerts/cert.pem  /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/peers/peer0.Org2.com/msp/signcerts/peer0.Org2.com-cert.pem


sudo cp ./Org2CA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/peers/peer1.Org2.com/msp/admincerts/Admin@Org2.com-cert.pem

sudo cp ./Org2CA/fabric-ca-client/peer1.Org2.com/cacerts/ca-Org2-7054.pem /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/peers/peer1.Org2.com/msp/cacerts/ca.Org2.com-cert.pem

sudo rm -rf /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/peers/peer1.Org2.com/msp/keystore

sudo cp ./Org2CA/fabric-ca-client/peer1.Org2.com/keystore /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/peers/peer1.Org2.com/msp -r 

sudo cp ./Org2CA/fabric-ca-client/peer1.Org2.com/signcerts/cert.pem  /home/julio/hlf/FinalExam/question2-CA/finalexam/crypto-config/peerOrganizations/Org2.com/peers/peer1.Org2.com/msp/signcerts/peer1.Org2.com-cert.pem



