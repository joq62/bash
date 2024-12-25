#!/bin/bash
# runs an compile application Supports git clone 
#appdir=$1
#appl=$2
# pa=$3
# sname=$4
# cookie=$5
# start_cmd
# appl=$6
# 
echo appdir=$1
echo appl=$2


#
cd $1
erl -pa $3 -sname $4 -setcookie $5 -run $2 start_link
#-noinput -detached  
cd ..
