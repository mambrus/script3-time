#!/bin/bash
#Author: Michael Ambrus (michael.ambrus@sonymobile.com)
# 2012-03-21

if [ -z $EPOCH_SH ]; then

EPOCH_SH="epoch.sh"

function epoch() {
	if [ $# -eq 0 ]; then
		date "+%s.%N"
	else
		if [ "X$(echo $1 | egrep '^[0-9]+\.[0-9]+$')" == "X$1" ]; then
			#Format given is in seconds and fractions of seconds
			date "+%s.%N" -d "@$1"
		else
			#Assume any vaid data date/time format
			date "+%s.%N" -d "$1"
		fi
	fi
}

source s3.ebasename.sh
if [ "$EPOCH_SH" == $( ebasename $0 ) ]; then
  #Not sourced, do something with this.
  set -e
  set -u
  
  EPOCH_SH_INFO=${EPOCH_SH}
  source .time.ui..epoch.sh
  
  epoch "$@"
  exit $?
fi

fi
