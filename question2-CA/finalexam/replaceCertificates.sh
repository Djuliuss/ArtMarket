#!/bin/bash

# channel and genesis block
cp AmazonCA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/pcxchg/crypto-config/peerOrganizations/Amazon.com/msp/admincerts/Admin@Amazon.com-cert.pem

cp AmazonCA/fabric-ca-client/msp/cacerts/ca-Amazon-7054.pem /home/julio/hlf/FinalExam/pcxchg/crypto-config/peerOrganizations/Amazon.com/msp/cacerts/ca.Amazon.com-cert.pem

# admin User
cp AmazonCA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/pcxchg/crypto-config/peerOrganizations/Amazon.com/users/Admin@Amazon.com/msp/admincerts/Admin@Amazon.com-cert.pem

cp AmazonCA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/pcxchg/crypto-config/peerOrganizations/Amazon.com/users/Admin@Amazon.com/msp/signcerts/Admin@Amazon.com-cert.pem

cp AmazonCA/fabric-ca-client/msp/cacerts/ca-Amazon-7054.pem /home/julio/hlf/FinalExam/pcxchg/crypto-config/peerOrganizations/Amazon.com/users/Admin@Amazon.com/msp/cacerts/ca.Amazon.com-cert.pem

rm -rf /home/julio/hlf/FinalExam/pcxchg/crypto-config/peerOrganizations/Amazon.com/users/Admin@Amazon.com/msp/keystore

cp AmazonCA/fabric-ca-client/msp/keystore /home/julio/hlf/FinalExam/pcxchg/crypto-config/peerOrganizations/Amazon.com/users/Admin@Amazon.com/msp -r


# peer certificates
cp AmazonCA/fabric-ca-client/msp/signcerts/cert.pem /home/julio/hlf/FinalExam/pcxchg/crypto-config/peerOrganizations/Amazon.com/peers/peer0.Amazon.com/msp/admincerts/Admin@Amazon.com-cert.pem

cp AmazonCA/fabric-ca-client/peer0.Amazon.com/cacerts/ca-Amazon-7054.pem /home/julio/hlf/FinalExam/pcxchg/crypto-config/peerOrganizations/Amazon.com/peers/peer0.Amazon.com/msp/cacerts/ca.Amazon.com-cert.pem

rm -rf /home/julio/hlf/FinalExam/pcxchg/crypto-config/peerOrganizations/Amazon.com/peers/peer0.Amazon.com/msp/keystore

cp AmazonCA/fabric-ca-client/peer0.Amazon.com/keystore /home/julio/hlf/FinalExam/pcxchg/crypto-config/peerOrganizations/Amazon.com/peers/peer0.Amazon.com/msp -r 

cp AmazonCA/fabric-ca-client/peer0.Amazon.com/signcerts/cert.pem  /home/julio/hlf/FinalExam/pcxchg/crypto-config/peerOrganizations/Amazon.com/peers/peer0.Amazon.com/msp/signcerts/peer0.Amazon.com-cert.pem

