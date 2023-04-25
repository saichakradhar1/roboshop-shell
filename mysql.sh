echo -e "\e[36m>>>>>>>>>>>>>>Disable  my sql<<<<<<<<<<<<<<<<<\e[0m"
dnf module disable mysql -y
echo -e "\e[36m>>>>>>>>>>>>>>Copying My SqL Repo file<<<<<<<<<<<<<<<<<\e[0m"
cp /root/roboshop-shell/mysql.repo /etc/yum.repos.d/mysql.repo

echo -e "\e[36m>>>>>>>>>>>>>>Install My Sql<<<<<<<<<<<<<<<<<\e[0m"
yum install mysql-community-server -y

echo -e "\e[36m>>>>>>>>>>>>>>Start My sql<<<<<<<<<<<<<<<<<\e[0m"
systemctl enable mysqld
systemctl restart mysqld

echo -e "\e[36m>>>>>>>>>>>>>>Reset My sql Password<<<<<<<<<<<<<<<<<\e[0m"
mysql_secure_installation --set-root-pass RoboShop@1
mysql -uroot -pRoboShop@1