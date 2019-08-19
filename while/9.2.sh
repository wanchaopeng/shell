#!/bin/bash
file=$1
if expr "$file" : ".*\.log" &>/dev/null
  then
    :
  else
    echo $"usage:$0 xxx.log"
    exit 1
fi
  while true
    do
      netstat -tpn|awk -F [" "]+ '{print $1,$2,$3,$4,$5,$6}'|grep "ESTABLISHED"|awk -F "[ :]+" '{print $(NF-2)}' |sort |uniq -c|head -5 >/tmp/tmp.log
    while read line 
      do
        ip=`echo $line|awk '{print $2}'`
        count=`echo $line|awk '{print $1}'`
        if [ $count -gt 500 ]  && [ `iptables -L -n |grep "$ip|wc -l"` -lt 1 ]
          then
            iptables -I INPUT -s $ip -j DROP 
            echo "$line is dropped" >>/tmp/droplist_$(date +%F).log
        fi
      done</tmp/tmp.log
      sleep 180
    done
