#!/bin/bash
# 1st argument for file to scroll through, full or local path
# 2nd for scroll speed 1 -> 9 with 9 the fastest
# 3rd for the pause once the scroll has complete, can be any value 

file=$1
speed=$2
wait=$3

function make_text() {
	line=$(cat $file | wc -l)
	for line in `seq $line` 
	do
		sed -n ${line}p $file
		sleep 0.${speed}
	done
	sleep $wait
	clear
}

x=0

while [ $x = 0 ]
do
	make_text
done
