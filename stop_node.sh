#!/usr/bin/env escript
%% -*- erlang -*-
%%! -sname stop_node -setcookie a
main([NodeName,_Cookie]) ->
    try
	{ok,HostName}=net:gethostname(),
	Node=list_to_atom(NodeName++"@"++HostName),
	rpc:call(Node,init,stop,[],5000),
	
	io:format("HostName ~p~n", [HostName]),
	io:format("Node ~p~n", [Node])
    catch
        _:_ ->
            usage()
    end;
main(X) ->
    io:format("usage: ~p~n",[X]),
    usage().

%main([NodeName]) ->
%    {ok,HostnName}=net:gethostname(),
%    Node=list_to_atom(NodeName++"@"++HostName),
%    io:format("Node ~p", [Node]),
%    timer:sleep(2000),
%    usage(),
 %   end;

usage() ->
   halt(1).

