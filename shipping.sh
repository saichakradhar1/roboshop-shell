echo -e "\e[36m>>>>>>>>>>>>>>Installing maven<<<<<<<<<<<<<<<<<\e[0m"
yum install maven -y

echo -e "\e[36m>>>>>>>>>>>>>>Create App user<<<<<<<<<<<<<<<<<\e[0m"
useradd roboshop

echo -e "\e[36m>>>>>>>>>>>>>>create App directory<<<<<<<<<<<<<<<<<\e[0m"
rm -rf /app
mkdir /app

echo -e "\e[36m>>>>>>>>>>>>>>Download App content<<<<<<<<<<<<<<<<<\e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
cd /app
unzip /tmp/shipping.zip

echo -e "\e[36m>>>>>>>>>>>>>>Download maven dependencies<<<<<<<<<<<<<<<<<\e[0m"
mvn clean package
mv target/shipping-1.0.jar shipping.jar

echo -e "\e[36m>>>>>>>>>>>>>>Installing my sql<<<<<<<<<<<<<<<<<\e[0m"
yum install mysql -y

echo -e "\e[36m>>>>>>>>>>>>>>Load schema<<<<<<<<<<<<<<<<<\e[0m"
mysql -h mysql-dev.rdevops72.online -uroot -pRoboShop@1 < /app/schema/shipping.sql

echo -e "\e[36m>>>>>>>>>>>>>>Setup systemd service <<<<<<<<<<<<<<<<<\e[0m"
cp  /root/roboshop-shell/shipping.service /etc/systemd/system/shipping.service

echo -e "\e[36m>>>>>>>>>>>>>>Restart shipping<<<<<<<<<<<<<<<<<\e[0m"
systemctl daemon-reload
systemctl enable shipping
systemctl start shipping