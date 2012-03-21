#!/bin/bash
#Author: Michael Ambrus (michael.ambrus@sonymobile.com)
# 2012-03-21

if [ -z $EPOCH_SH ]; then

EPOCH_SH="epoch.sh"

function epoch() {
	date "+%s.%N" -d "$1"
}

source s3.ebasename.sh
if [ "$EPOCH_SH" == $( ebasename $0 ) ]; then
  #Not sourced, do something with this.
  set -e
  set -u

  epoch "$@"
  exit $?
fi

fi
