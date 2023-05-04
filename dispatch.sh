echo -e "\e[36m>>>>>>>>>>>>>>Install Golang<<<<<<<<<<<<<<<<<\e[0m"
yum install golang -y
echo -e "\e[36m>>>>>>>>>>>>>>Add Application user<<<<<<<<<<<<<<<<<\e[0m"
useradd roboshop
mkdir /app
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip
cd /app
unzip /tmp/dispatch.zip
cd /app
go mod init dispatch
go get
go build
cp /root/roboshop-shell/dispatch.service /etc/systemd/system/dispatch.service

echo -e "\e[36m>>>>>>>>>>>>>>Restart dispatch<<<<<<<<<<<<<<<<<\e[0m"
systemctl daemon-reload
systemctl enable dispatch
systemctl start dispatch
