echo -e "\e[36m>>>>>>>>>>>>>>Configuring Node js repos<<<<<<<<<<<<<<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[36m>>>>>>>>>>>>>>Installing Node js repos<<<<<<<<<<<<<<<<<\e[0m"
yum install nodejs -y
echo -e "\e[36m>>>>>>>>>>>>>>Adding user<<<<<<<<<<<<<<<<<\e[0m"
useradd roboshop

echo -e "\e[36m>>>>>>>>>>>>>>Create Application Directory<<<<<<<<<<<<<<<<<\e[0m"
rm -rf /app
mkdir /app

echo -e "\e[36m>>>>>>>>>>>>>>Configuring roboshop artifacts<<<<<<<<<<<<<<<<<\e[0m"
curl -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app

echo -e "\e[36m>>>>>>>>>>>>>>Unzip user.zip file<<<<<<<<<<<<<<<<<\e[0m"
unzip /tmp/cart.zip

echo -e "\e[36m>>>>>>>>>>>>>>Install nodejs Dependencies<<<<<<<<<<<<<<<<<\e[0m"
npm install

echo -e "\e[36m>>>>>>>>>>>>>>copying files <<<<<<<<<<<<<<<<<\e[0m"
cp /root/roboshop-shell/cart.service /etc/systemd/system/cart.service

systemctl daemon-reload

echo -e "\e[36m>>>>>>>>>>>>>>Restart User<<<<<<<<<<<<<<<<<\e[0m"
systemctl enable cart
systemctl start cart