#!/bin/bash

cp /home/julio/hlf/FinalExam/question3-nodejs/finalexam/org3-artifacts/crypto-config/peerOrganizations/Org3.com/users/Admin@Org3.com/msp/admincerts/Admin@Org3.com-cert.pem ./app/certs -r
cp /home/julio/hlf/FinalExam/question3-nodejs/finalexam/org3-artifacts/crypto-config/peerOrganizations/Org3.com/users/Admin@Org3.com/msp/keystore/* ./app/certs -r

cd app/certs
awk '{printf "%s\\n", $0}' Admin\@Org3.com-cert.pem > Org3AdminFormatted.pem


cp b1fe17738f8d1d054d3f57f14bfaf2c61d1bd775db4c7e1d6ed41ad500fea844_sk ~/.hfc-key-store/b1fe17738f8d1d054d3f57f14bfaf2c61d1bd775db4c7e1d6ed41ad500fea844-priv




