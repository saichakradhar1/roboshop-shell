cp mongo.repo /etc/yum.repos.d/mongo.repo
echo -e "\e[36m>>>>>>>>>>>>>>Install mongodb<<<<<<<<<<<<<<<<<\e[0m"
yum install mongodb-org -y

sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/mongod.conf
echo -e "\e[36m>>>>>>>>>>>>>>Enable mangodb<<<<<<<<<<<<<<<<<\e[0m"
systemctl enable mongod
systemctl restart mongod