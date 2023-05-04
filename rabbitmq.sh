curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash

echo -e "\e[36m>>>>>>>>>>>>>>Install erlang<<<<<<<<<<<<<<<<<\e[0m"
yum install erlang -y
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash

echo -e "\e[36m>>>>>>>>>>>>>>Install rabbitmq server<<<<<<<<<<<<<<<<<\e[0m"
yum install rabbitmq-server -y

echo -e "\e[36m>>>>>>>>>>>>>>Enable rabbit mq server<<<<<<<<<<<<<<<<<\e[0m"
systemctl enable rabbitmq-server

echo -e "\e[36m>>>>>>>>>>>>>>Start rabbitmq server<<<<<<<<<<<<<<<<<\e[0m"
systemctl start rabbitmq-server

echo -e "\e[36m>>>>>>>>>>>>>>Add Application user<<<<<<<<<<<<<<<<<\e[0m"
rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
