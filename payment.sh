echo -e "\e[36m>>>>>>>>>>>>>>Install python<<<<<<<<<<<<<<<<<\e[0m"
yum install python36 gcc python3-devel -y

echo -e "\e[36m>>>>>>>>>>>>>>Add Application user<<<<<<<<<<<<<<<<<\e[0m"
useradd roboshop
mkdir /app
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip
cd /app
unzip /tmp/payment.zip
cd /app
pip3.6 install -r requirements.txt
cp /root/roboshop-shell/payment.service /etc/systemd/system/payment.service

echo -e "\e[36m>>>>>>>>>>>>>>Restart payment<<<<<<<<<<<<<<<<<\e[0m"
systemctl daemon-reload
systemctl enable payment
systemctl start payment

