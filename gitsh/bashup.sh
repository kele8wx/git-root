#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
args=$#
token=${!args}

if [ -z "$token" ]
then
    echo "please use token download."
    exit 1
fi
