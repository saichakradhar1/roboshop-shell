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
curl -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app

echo -e "\e[36m>>>>>>>>>>>>>>unzip Application content<<<<<<<<<<<<<<<<<\e[0m"
unzip /tmp/cart.zip
cd /app

echo -e "\e[36m>>>>>>>>>>>>>>Install Node js<<<<<<<<<<<<<<<<<\e[0m"
npm install
cp   /root/roboshop-shell/cart.service /etc/systemd/system/cart.service

echo -e "\e[36m>>>>>>>>>>>>>>Start Catalogue Service<<<<<<<<<<<<<<<<<\e[0m"
systemctl daemon-reload
systemctl enable cart
systemctl start cart
