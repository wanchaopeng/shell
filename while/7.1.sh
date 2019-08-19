#!/bin/bash
sum=0
exec <$1
while read line
  do
    size=`echo $line|awk '{print $10}'`
    expr $size + 1 &>/dev/null
    if [ $? -ne 0 ]
      then
        continue
    fi
    ((sum=sum+$size))
  done
  echo "${1}:total:${sum}bytes = `echo $((${sum}/1024))`KB"
