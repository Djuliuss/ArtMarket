#!/bin/bash

rm -f app/certs/*sk 
rm -f app/certs/*pem
cp /home/julio/hlf/FinalExam/question3-nodejs/finalexam/org3-artifacts/crypto-config/peerOrganizations/Org3.com/users/Admin@Org3.com/msp/admincerts/Admin@Org3.com-cert.pem ./app/certs -r
cp /home/julio/hlf/FinalExam/question3-nodejs/finalexam/org3-artifacts/crypto-config/peerOrganizations/Org3.com/users/Admin@Org3.com/msp/keystore/* ./app/certs -r

cd app/certs
awk '{printf "%s\\n", $0}' Admin\@Org3.com-cert.pem > Org3AdminFormatted.pem

# once you have run this script once, uncomment the follow line with the new key and run again 
# (optionally, comment the the lines above)

cp 99ffa789d79fdf64eefdbfa687e4b4b0b0b625195aff3050b2c1b58e6b6f4bfc_sk ~/.hfc-key-store/99ffa789d79fdf64eefdbfa687e4b4b0b0b625195aff3050b2c1b58e6b6f4bfc-priv



