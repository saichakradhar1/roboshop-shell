echo -e "\e[36m>>>>>>>>>>>>>>Configuring Node js repos<<<<<<<<<<<<<<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[36m>>>>>>>>>>>>>>Installing Node js repos<<<<<<<<<<<<<<<<<\e[0m"
yum install nodejs -y

echo -e "\e[36m>>>>>>>>>>>>>>Add Application user<<<<<<<<<<<<<<<<<\e[0m"
useradd roboshop

echo -e "\e[36m>>>>>>>>>>>>>>Create Application directory<<<<<<<<<<<<<<<<<\e[0m"
rm -rf /app
mkdir /app

echo -e "\e[36m>>>>>>>>>>>>>>Download Application content<<<<<<<<<<<<<<<<<\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app

echo -e "\e[36m>>>>>>>>>>>>>>unzip Application content<<<<<<<<<<<<<<<<<\e[0m"
unzip /tmp/catalogue.zip
cd /app

echo -e "\e[36m>>>>>>>>>>>>>>Install Node js<<<<<<<<<<<<<<<<<\e[0m"
npm install
cp  /home/centos/roboshop-shell/catalogue.service /etc/systemd/system/catalogue.service

echo -e "\e[36m>>>>>>>>>>>>>>Start Catalogue Service<<<<<<<<<<<<<<<<<\e[0m"
systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue

echo -e "\e[36m>>>>>>>>>>>>>>Copy Mongodb Repo<<<<<<<<<<<<<<<<<\e[0m"
cp   /home/centos/roboshop-shell/catalogue.service /etc/yum.repos.d/mongo.repo

echo -e "\e[36m>>>>>>>>>>>>>>Install  mongodb client<<<<<<<<<<<<<<<<<\e[0m"
yum install mongodb-org-shell -y

echo -e "\e[36m>>>>>>>>>>>>>>Load Schema<<<<<<<<<<<<<<<<<\e[0m"
mongo --host mongodb-dev.rdevopsb72.online </app/schema/catalogue.js