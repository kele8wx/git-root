#!/bin/bash

find /home/fbsd/server_s[0-9]*/logs/ -mtime +7 -type d|xargs rm -rf
find /data/gamelog/  -type d -mtime +7|xargs rm -rf 
find /data/log_post_tool/logs/ -mtime +7|xargs rm -f

