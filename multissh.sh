#!/bin/sh
#
# Use tmux-cssh to connect to all hosts
# https://github.com/dennishafemann/tmux-cssh
#

CSSH="cssh"

inventory=`mktemp`
grep -v '\[' inventory | awk '{print "pi@" $1}' > $inventory

$CSSH -f $inventory

rm $inventory
