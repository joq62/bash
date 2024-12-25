#!/bin/bash

#appdir=$1
#test_file=$2
#appl=$3

echo appdir $1
echo giturl $2

#
rm -rf erl_cra* rebar3_crashreport;
rm -rf *~ */*~ */*/*~ */*/*/*~;
rm -rf test_ebin;
rm -rf *.beam */*.beam;
rm -rf test.rebar;
rm -rf logs;
rm -rf Mnesia.*;
rm -rf _build;
rm -rf ebin;
rm -rf rebar.lock;
rm -rf *_specs;
#INFO: Creating eunit test code using test_ebin dir;
rm -rf common_include;
cp -r ~/erlang/common_include .
mkdir test_ebin;
cp test_config/test.rebar.config rebar.config;
erlc -o test_ebin test/*.erl;
cp test/*.app test_ebin;
rebar3 compile
	#INFO: Starts the eunit testing .................
erl -pa test_ebin\
    -pa _build/default/lib/log/ebin\
    -pa _build/default/lib/cmn_server/ebin\
    -pa _build/default/lib/api_$(appl)/ebin\
    -pa _build/default/lib/$(appl)/ebin\
 -sname test_bash\
 -run $(m) start\
 -setcookie a\
 -noinput\
 -detached
