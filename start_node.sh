#!/bin/bash
# assumes tha the node is allready stopped

# nodename=$1
# cookie=$2

erl -sname $1 -setcookie $2 -noinput -detached
