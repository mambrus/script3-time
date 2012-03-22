#!/bin/bash

#set -e
#set -u

D1=$(time.tdiff.sh "$1" "$2")
#echo $D1
AT=$(time.tadd.sh "$3" "$D1")
#echo $AT
D2=$(time.tdiff.sh "$AT" "$4")
echo $D2
