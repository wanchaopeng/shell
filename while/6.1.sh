#!/bin/bash
if [ $# -ne 1 ]
  then
    echo $"usage $0 url"
    exit 1
fi

while true
  do
    if [ `curl -o /dev/null --connect-timeout 5 -s -w "%{http_code}" $1|egrep -w "200|301|302"|wc -l` -ne 1 ]
      then 
        echo "$1 is error."
      else
        echo "$1 is ok"
    fi 
    sleep 10
done
