#!/bin/bash
printf "del key\r\n"|nc 127.0.0.1 11211 &>/dev/null  #使用nc链接memcached,并执行del key 清理key这个名称的健值
printf "set key 0 0 10 \r\nshunmai123\r\n"|nc 127.0.0.1 11211 &>/dev/null  #插入键值key-->shunmai123到memcached
mcValues=`printf "get key\r\n"|nc 127.0.0.1 11211|grep shunmai123 |wc -l
if [ $mcValues -eq 1 ]  #键值数为1，表示插入成功，否则 表示失败
  then
    echo "memcached status is ok"
  else 
    echo "memcached status is bad"
fi
