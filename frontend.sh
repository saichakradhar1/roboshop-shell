echo -e "\e[36m>>>>>>>>>>>>>>Install nginx<<<<<<<<<<<<<<<<<\e[0m"
yum install nginx -y
echo -e "\e[36m>>>>>>>>>>>>>>Copying roboshop config file<<<<<<<<<<<<<<<<<\e[0m"
cp roboshop.conf /etc/nginx/default.d/roboshop.conf
rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
echo -e "\e[36m>>>>>>>>>>>>>>Restart nginx<<<<<<<<<<<<<<<<<\e[0m"
systemctl restart nginx
systemctl enable nginx