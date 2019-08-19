#!/bin/bash
filc=$1
while true
  do
    awk '{print $1}' $1|grep -v "^$"|sort|uniq -c >/tmp/tmp.log
    exec </tmp/tmp.log
    while read line
      do
        ip=`echo $line|awk '{print $1}'`
        count=`echo $line|awk '{print $1}'`
        if [ $count -gt 500 ] && [ `iptables -L -n|GREP "$ip"|wc -l` -lt 1 ]
          then
            iptables -I INPUT -s $ip -j DROP
            echo "$line is dropped" >>/tmp/droplist_$(date +%F).log
        fi
      done
      sleep 3600
  done
