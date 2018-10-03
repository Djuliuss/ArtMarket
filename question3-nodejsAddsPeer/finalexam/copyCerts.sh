#!/bin/bash

rm -f app/certs/*sk 
rm -f app/certs/*pem

cp /home/julio/hlf/FinalExam/question3-nodejsAddsPeer/finalexam/crypto-config/peerOrganizations/Org1.com/users/Admin@Org1.com/msp/admincerts/Admin@Org1.com-cert.pem ./app/certs -r
cp /home/julio/hlf/FinalExam/question3-nodejsAddsPeer/finalexam/crypto-config/peerOrganizations/Org1.com/users/Admin@Org1.com/msp/keystore/* ./app/certs -r

cp /home/julio/hlf/FinalExam/question3-nodejsAddsPeer/finalexam/crypto-config/peerOrganizations/Org2.com/users/Admin@Org2.com/msp/admincerts/Admin@Org2.com-cert.pem ./app/certs -r
cp /home/julio/hlf/FinalExam/question3-nodejsAddsPeer/finalexam/crypto-config/peerOrganizations/Org2.com/users/Admin@Org2.com/msp/keystore/* ./app/certs -r

cp /home/julio/hlf/FinalExam/question3-nodejsAddsPeer/finalexam/org3-artifacts/crypto-config/peerOrganizations/Org3.com/users/Admin@Org3.com/msp/admincerts/Admin@Org3.com-cert.pem ./app/certs -r
cp /home/julio/hlf/FinalExam/question3-nodejsAddsPeer/finalexam/org3-artifacts/crypto-config/peerOrganizations/Org3.com/users/Admin@Org3.com/msp/keystore/* ./app/certs -r

cd app/certs
awk '{printf "%s\\n", $0}' Admin\@Org1.com-cert.pem > Org1AdminFormatted.pem
awk '{printf "%s\\n", $0}' Admin\@Org2.com-cert.pem > Org2AdminFormatted.pem
awk '{printf "%s\\n", $0}' Admin\@Org3.com-cert.pem > Org3AdminFormatted.pem

cp 5a0903608fdc38ef4526723e3804c4a68d8b17f499195644aa5b6024581fca6b_sk ~/.hfc-key-store/5a0903608fdc38ef4526723e3804c4a68d8b17f499195644aa5b6024581fca6b-priv
cp 5c0d61011add8f2033c3e2bb8b2e6d8f25c02ddd54d3dc0c3ff8aed52f8e4d9e_sk ~/.hfc-key-store/5c0d61011add8f2033c3e2bb8b2e6d8f25c02ddd54d3dc0c3ff8aed52f8e4d9e-priv
cp 995ad705b8ea0d249607403f7d682ff56adcca837a90bc75de87c2fa39bfedfb_sk ~/.hfc-key-store/995ad705b8ea0d249607403f7d682ff56adcca837a90bc75de87c2fa39bfedfb-priv
