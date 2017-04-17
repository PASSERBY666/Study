#!/bin/bash

IP=$(/sbin/ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:")

echo "updating your system..."
apt update
apt dist-upgrade
echo "done!"

echo "installing packages..."
apt install ruby aria2 python python-pip git
echo "done!"

echo "installing shadowsocks..."
pip install shadowsocks
read -p "input your password : " PASSWD
echo "{
    \"server\":\"$IP\",
    \"server_port\":8388,
    \"local_address\": \"127.0.0.1\",
    \"local_port\":1080,
    \"password\":\"$PASSWD\",
    \"timeout\":300,
    \"method\":\"aes-256-cfb\"
}
" > /etc/ss-config.json
ssserver -c /etc/ss-config.json -d start
echo "your ss config is :"
cat /etc/ss-config.json
read -p "ENTER to continue"

cd

echo "installing webui-aria2..."
killall apache2
killall nginx
git clone https://github.com/ziahamza/webui-aria2.git
cd webui-aria2
nohup ruby -run -e httpd . -p 80
read -p "input key" KEY
read -p "input user" USER
read -p "input passwd" PASSWD
nohup aria2c --enable-rpc --rpc-listen-all --rpc-user=$USER --rpc-passwd=$PASSWD --rpc-secret=$key -D
echo "done! enjoy it! :)"
