#!/bin/bash
# Supports git clone 
#appdir=$1
#appl=$2
echo appdir=$1
echo appl=$2


#
cd $1
make eunit m=all appl=$2
cat logs/eunit_node/log.logs/file.1
cd ..
