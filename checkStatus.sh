#!/bin/bash
while read -ru 4 LINE; do
    status=`curl $LINE -k -s -f -o /dev/null && echo "SUCCESS" || echo "ERROR"`
    if [ $status = "SUCCESS" ]
    then
        continue
    else
        exit
    fi
done 4< "$1"
/usr/local/bin/wp lscache-admin set_option cdn true --allow-root --path="/var/www/webroot/ROOT" 
rm -rf /var/spool/cron/root
