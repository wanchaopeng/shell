#!/bin/bash
if [ `ps -ef|grep -v grep |grep mysql|wc -l` -gt 0 ]
  then
    echo "MYSQL is Running"
  else 
    echo "MYSQL is Stopped"
    #systemctl start mysqld
fi
