#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

DATE=`date -d 'yesterday' +%Y%m%d`

AREA=`ls -l /home/fbsd | grep "server_s" | grep ^d | awk '{print $NF}' | egrep -o "[0-9]*[0-9]"`


#cut syslog
for i in $AREA
do
    mv /data/gameinfo/${i}/act.log /data/gameinfo/${i}/act${DATE}.log 
    mv /data/gameinfo/${i}/special.log /data/gameinfo/${i}/special${DATE}.log 
done

#rm log
find /home/fbsd/server_s[0-9]*/logs/ -mtime +7 -type d|xargs rm -rf
find /data/gamelog/  -type d -mtime +7|xargs rm -rf 
find /data/log_post_tool/logs/ -mtime +7|xargs rm -f

#restat salt
/etc/init.d/salt-minion restart
