#!/bin/bash
if [ $# -eq 0 ]; then
	LISTFILE='packages-installed.list'
else
	LISTFILE=$1
fi

if [ ! -f $LISTFILE ]; then
	echo "No Package list found"
	exit
fi
declare -a packagelist=(`cat $LISTFILE | sort -u`);
echo "sudo apt-get -assume-yes install${packagelist[@]} "

