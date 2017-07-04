#!/bin/bash

password='123456'
date; sleep 1s

# open cow
cow and &

sleep 1s

#open vpn
echo $password | sudo -S openvpn --daemon --config /home/why/soft/openvpn/client.ovpn

echo "执行完毕"

sleep 2s
#open pycharm 
sh /home/why/soft/pycharm-2017.1.2/bin/pycharm.sh &
sleep 2s
cd /home/why/work/t2cloud/portal
git checkout develop | git pull
sleep 2s
echo "portal代码更新完毕"
cd /home/why/work/t2cloud/mental
git checkout develop | git pull
sleep 2s
echo $password | sudo -S pip2 install -i http://192.168.103.137:8000/simple --trusted-host 192.168.103.137 -U -r requirements.txt
sleep 3s
echo "mental代码更新完毕"

cd /home/why
message=$(stat .navicat64/ | grep Access)
date_change=$(date -d "${message:8:10}" +%s)
date_now=$(date -d $(date +"%Y-%m-%d" -d"-10 day") +%s)
if [ $date_now -gt $date_change ]; then 
	rm -rf .navicat64/
else
	echo "navicat尚未过期"
fi

#open navicat
sh /home/why/soft/navicat112_premium_cs_x64/start_navicat.sh &


