#!/bin/sh
# ROOT_UID=0
#
# # Run as root
# if [ "$UID" -ne "$ROOT_UID" ]; then
#   echo "Must be root to run this script."
#   exit
# fi

LAUNCH_DIR=${PWD}

systemctl disable xivwiki.com.service
stop xivwiki.com.service

cd ..

rm -rf node_modules/
yarn
# ensure conf files
cd $LAUNCH_DIR
yes | cp -f xivwiki.com.service /etc/systemd/system/xivwiki.com.service
yes | cp -f xivwiki.com.nginx.conf /etc/nginx/conf.d/xivwiki.com.conf

systemctl start xivwiki.com.service
systemctl enable xivwiki.com.service

nginx -s reload
