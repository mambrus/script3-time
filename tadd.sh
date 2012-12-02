#!/bin/bash
#Author: Michael Ambrus (michael.ambrus@sonymobile.com)
# 2012-03-21

if [ -z $TADD_SH ]; then

TADD_SH="tadd.sh"

function tadd() {
	local T0
	local T1
	local A="$1"
	local B="$2"

	if [ "X$(echo $A | egrep '^[0-9]+\.[0-9]+$')" == "X$A" ]; then
		T0=$A
	else
		T0=$(epoch "$A")
	fi

	if [ "X$(echo $B | egrep '^[0-9]+\.[0-9]+$')" == "X$B" ]; then
		T1=$B
	else
		T1=$(epoch "$B")
	fi

	#echo "$T0,$T1" | awk -F"," '{printf("%f + %f = %f\n",$1,$2,$2+$1);}'
	echo "$T0,$T1" | awk -F"," '{printf("%f\n",$1+$2);}'
}

source s3.ebasename.sh
if [ "$TADD_SH" == $( ebasename $0 ) ]; then
	#Not sourced, do something with this.
	source time.epoch.sh
	set -e
	set -u

	if [ $# != 2 ]; then
		echo "Syntax error [$TADD_SH]: Exactly two arguments expected" 1>&2
		exit 1
	fi

	tadd "$@"
	exit $?
fi

fi
