#!/bin/bash
echo method2-----------------------
if [ "`netstat -tnlp|grep 3306 |awk -F "[ :]+" '{print $5}'`" = "3306" ]
  then
    echo "MYSQL is Running"
  else 
    echo "MYSQL is Stopped"
    systemctl start mysqld 
fi
