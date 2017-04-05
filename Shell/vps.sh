#!/bin/bash
echo "updating your system..."
apt update
apt dist-upgrade
echo "done!"

echo "installing packages..."
apt install ruby aria2 python python-pip git
echo "done!"

echo "installing shadowsocks..."
pip install shadowsocks
##please change the ip and password to use
echo "{
    \"server\":\"your server ip(change me!!!)\",
    \"server_port\":8388,
    \"local_address\": \"127.0.0.1\",
    \"local_port\":1080,
    \"password\":\"your password(change me!!!)\",
    \"timeout\":300,
    \"method\":\"aes-256-cfb\"
}
" > /etc/ss-config.json
ssserver -c /etc/ss-config.json -d start
echo"done!"

cd

echo "installing webui-aria2..."
killall apache2
git clone https://github.com/ziahamza/webui-aria2.git
cd webui-aria2
nohup ruby -run -e httpd . -p 80
##please change the 'user' 'passwd' 'secret'
nohup aria2c --enable-rpc --rpc-listen-all --rpc-user=change-me --rpc-passwd=change-me --rpc-secret=change-me -D
echo "done! enjoy it! :)"
