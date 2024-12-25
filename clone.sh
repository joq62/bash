#!/bin/bash
# Supports git clone 
#appdir=$1
#giturl=$2
echo appdir $1
echo giturl $2

#
rm -rf $1
mkdir $1
git clone $2 $1
ls $1
