all:
	echo hello
clean:
	rm -rf *~ */*~ */*/*~
	rm -rf cmn erl_crash.dump
start_node:
	./stop_node.sh $(nodename) $(cookie)
	./start_node.sh $(nodename) $(cookie)
testing:
	./stop_node.sh eunit_node
	./clone.sh cmn https://github.com/joq62/cmn_server.git
	./compile.sh cmn
	./eunit_test.sh cmn cmn_server
eunit: 
	rm -rf erl_cra* rebar3_crashreport;
	rm -rf *~ */*~;
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
	erlc -I common_include -o test_ebin test/connect.erl;
#INFO: Starts the eunit testing .................
	erl -pa test_ebin\
	 -sname connect -setcookie a

