
dnf module disable mysql -y
cp /root/roboshop-shell/mysql.repo /etc/yum.repos.d/mysql.repo
yum install mysql-community-server -y
systemctl enable mysqld
systemctl restart mysqld
mysql_secure_installation --set-root-pass $mysql_root_password