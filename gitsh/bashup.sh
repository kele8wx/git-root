#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
args=$#
token=${!args}

if [ -z "$token" ]
then
    echo "please use token download."
    exit 1
fi

#bash_update
cd /usr/local/src/
duang -N http://duang.opstack.cc:59808/tools/bash/bash_update.zip $token
unzip bash_update.zip
cd bash_update
sh bashlog_install.sh
cd ..