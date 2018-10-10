#!/bin/bash

rm -f app/certs/*sk 
rm -f app/certs/*pem

cp /home/julio/hlf/FinalExam/question3-nodejsAddsPeer/finalexam/org3-artifacts/crypto-config/peerOrganizations/Org3.com/users/Admin@Org3.com/msp/admincerts/Admin@Org3.com-cert.pem ./app/certs -r
cp /home/julio/hlf/FinalExam/question3-nodejsAddsPeer/finalexam/org3-artifacts/crypto-config/peerOrganizations/Org3.com/users/Admin@Org3.com/msp/keystore/* ./app/certs -r

cd app/certs
awk '{printf "%s\\n", $0}' Admin\@Org3.com-cert.pem > Org3AdminFormatted.pem

# include sk keys, comment out and run a second time
cp 7fb0d09fb05c5ec47cc873a55169fd1a89aabea893619f8876456fcec4158595_sk ~/.hfc-key-store/7fb0d09fb05c5ec47cc873a55169fd1a89aabea893619f8876456fcec4158595-priv
