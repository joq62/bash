%%% -------------------------------------------------------------------
%%% @author  : Joq Erlang
%%% @doc: : 
%%% Created :
%%%
%%% -------------------------------------------------------------------
-module(connect).       
 
-export([cmd/3,
	 cmd/4
	]).

-include("log.api").

%%---------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------


%% --------------------------------------------------------------------
%% Function: available_hosts()
%% Description: Based on hosts.config file checks which hosts are avaible
%% Returns: List({HostId,Ip,SshPort,Uid,Pwd}
%% --------------------------------------------------------------------
cmd(M,F,A)->
    cmd(M,F,A,5000).
cmd(M,F,A,T)->
    rpc:call(node(),M,F,A,T).
