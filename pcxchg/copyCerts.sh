#!/bin/bash

cp /home/julio/hlf/FinalExam/pcxchg/crypto-config/peerOrganizations/Asus.com/users/Admin\@Asus.com/msp/admincerts/Admin\@Asus.com-cert.pem ./producerApp/certs
cp /home/julio/hlf/FinalExam/pcxchg/crypto-config/peerOrganizations/Asus.com/users/Admin\@Asus.com/msp/keystore/* ./producerApp/certs

cd ./producerApp/certs
awk '{printf "%s\\n", $0}' Admin\@Asus.com-cert.pem > AsusAdminFormatted.pem

cd /home/julio/hlf/FinalExam/pcxchg
sudo cp producerApp/certs/a0284d2418fb329348af6fbc9159c912f3b2d6608a73c1ffdb4ea0739dcb1eb4_sk ~/.hfc-key-store/a0284d2418fb329348af6fbc9159c912f3b2d6608a73c1ffdb4ea0739dcb1eb4-priv