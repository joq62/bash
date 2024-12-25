#!/bin/bash
# Support rebar compile
#appdir=$1
echo appdir $1
cd $1 && rebar3 compile
cd ..
pwd
