#!/bin/bash

rm -f app/certs/*sk 
rm -f app/certs/*pem
cp /home/julio/hlf/FinalExam/question3-nodejs/finalexam/org3-artifacts/crypto-config/peerOrganizations/Org3.com/users/Admin@Org3.com/msp/admincerts/Admin@Org3.com-cert.pem ./app/certs -r
cp /home/julio/hlf/FinalExam/question3-nodejs/finalexam/org3-artifacts/crypto-config/peerOrganizations/Org3.com/users/Admin@Org3.com/msp/keystore/* ./app/certs -r

cd app/certs
awk '{printf "%s\\n", $0}' Admin\@Org3.com-cert.pem > Org3AdminFormatted.pem


cp 995ad705b8ea0d249607403f7d682ff56adcca837a90bc75de87c2fa39bfedfb_sk ~/.hfc-key-store/995ad705b8ea0d249607403f7d682ff56adcca837a90bc75de87c2fa39bfedfb-priv




