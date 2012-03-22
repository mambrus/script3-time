#!/bin/bash

FS=$(find . -name klog); for F in $FS; do echo $(dirname $(dirname $F)); echo $(dirname $(dirname $F)) | awk -F"-" '{print $4" "$5}' | sed -e 's/\(....\)\(..\)\(..\)\( \)\(..\)\(..\)\(..\)/RDv3_TS: \1-\2-\3\4\5:\6:\7 UTC/';egrep '(UTC)' $F | tail -n1; grep "prcmu_kick_a9wdog" $F | tail -n1; tail -n2 $F; echo; done | sed -e 's/crash> //' | sed -e 's/(\(.->.\))/{\1}/g' | awk 'BEGIN{new_batch=0}/Crash-YMD-HMS/{new_batch=1}/RDv3_TS/{split($0,A,":");RDv3_TS=A[2]":"A[3]":"A[4]}/suspend.*UTC/{split($0,A,"[");split(A[2],B,"]");T0=B[1];split($0,C,"(");split(C[2],D,")");WALL=D[1]}/[0-9]+\.[0-9]+\]/{split($0,A,"[");split(A[2],B,"]");LT=B[1]}{ if (new_batch){new_batch=0;system("time.wddiff.sh "T0" "LT" \""WALL"\" \""RDv3_TS"\"");printf("\n");}print $0}END{system("time.wddiff.sh "T0" "LT" \""WALL"\" \""RDv3_TS"\"");printf("\n");}'


