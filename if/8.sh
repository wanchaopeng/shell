#!/bin/bash
echo melthod6--------------
[ `rpm -qa nmap|wc -l` -lt 1 ]  && yum install nmap -y &>/dev/null
if [ `nmap 127.0.0.1 -p 3306 2>/dev/null  &>/dev/null && echo ok |grep ok |wc -l ` -gt 0 ]
  then 
    echo "MYSQL is Running"
  else
    echo "MYSQL is Stopped"
    #systemctl start mysqld
fi
  
