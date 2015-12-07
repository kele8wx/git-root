#!/bin/bash

GameLog=/data/gamelog/

find /home/fbsd/server_s[0-9]*/logs/ -mtime +14 -type d|xargs rm -rf
find /data/gamelog/  -type d -mtime +14|xargs rm -rf 
find /data/log_post_tool/logs/ -mtime +7|xargs rm -f

