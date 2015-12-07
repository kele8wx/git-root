#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

DATE=`date -d 'yesterday' +%Y%m%d`

AREA=`ls -l /home/fbsd | grep "server_s" | grep ^d | awk '{print $NF}' | egrep -o "[0-9]*[0-9]"`

for i in $AREA
do
    mv /data/gameinfo/${i}/act.log /data/gameinfo/${i}/act${DATE}.log 
    mv /data/gameinfo/${i}/special.log /data/gameinfo/${i}/special${DATE}.log 
done

/etc/init.d/salt-minion restart
