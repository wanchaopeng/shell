#!/bin/bash
echo method 2 -----------
if [ `netstat -tnlp|grep mysqld|wc -l` -gt 0 ]
  then
    echo "MYSQL is Running"
  else 
    echo "MYSQL is Stopped"
    #systemctl start mysqld
fi
