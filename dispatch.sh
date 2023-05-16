script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh

component=dispatch

func_print_head "Install golang"
yum install golang -y  &>>$log_file
func_stat_check $?
func_app_prereq

cd /app
go mod init ${component}
go get
go build

func_systemd_setup
