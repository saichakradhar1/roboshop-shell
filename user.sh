echo -e "\e[36m>>>>>>>>>>>>>>Configuring Node js repos<<<<<<<<<<<<<<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[36m>>>>>>>>>>>>>>Installing Node js repos<<<<<<<<<<<<<<<<<\e[0m"
yum install nodejs -y
echo -e "\e[36m>>>>>>>>>>>>>>Adding user<<<<<<<<<<<<<<<<<\e[0m"
useradd roboshop
mkdir /app
echo -e "\e[36m>>>>>>>>>>>>>>Configuring roboshop artifacts<<<<<<<<<<<<<<<<<\e[0m"
curl -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
echo -e "\e[36m>>>>>>>>>>>>>>Unzip user.zip file<<<<<<<<<<<<<<<<<\e[0m"
unzip /tmp/user.zip

cd /app
npm install
echo -e "\e[36m>>>>>>>>>>>>>>copying files <<<<<<<<<<<<<<<<<\e[0m"
cp /root/roboshop-shell/user.service /etc/systemd/system/user.service
systemctl daemon-reload
echo -e "\e[36m>>>>>>>>>>>>>>Restart User<<<<<<<<<<<<<<<<<\e[0m"
systemctl enable user
systemctl start user

echo -e "\e[36m>>>>>>>>>>>>>>Configuring mongodb<<<<<<<<<<<<<<<<<\e[0m"
cp /root/roboshop-shell/mongo.repo /etc/yum.repos.d/mongo.repo
echo -e "\e[36m>>>>>>>>>>>>>>Install mongodb shell<<<<<<<<<<<<<<<<<\e[0m"
yum install mongodb-org-shell -y
echo -e "\e[36m>>>>>>>>>>>>>>Install schema<<<<<<<<<<<<<<<<<\e[0m"
mongo --host mongodb-dev.rdevopsb72.online </app/schema/user.js