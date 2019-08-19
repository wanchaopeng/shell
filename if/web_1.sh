#!/bin/bash
echo http method1-------------
if [`netstat -tnlp|grep 80|awk -F "[ :]+" '{print $5}'` -eq 80 ]
#no.2 if [ "`netstat -tnlp|grep 80|awk -F "[ :]+" '{print $5}'`" = "80" ]
#no.3 if [ `netstat -tnlp|grep nginx|wc -l` -gt 0  ]
#no.4 if [ `lsof -i tcp:80|wc -l` -gt 0 ]
#no.5 [ `rpm -qa nmap|wc -l ` -lt 1  ] && yum install nmap -y &>/dev/null
#     if [ `nmap 127.0.0.1 -p 80 2>/dev/null|grep open|wc -l` -gt 0 ]
#no.6 [ `rpm -qa nc |wc -l` -lt 1 ] && yum instll nc -y &>/dev/null
#     if [`nc -w 2 127.0.0.1 80 &>/dev/null && echo ok |grep ok |wc -l` -gt 0 ]
#no.7 if [ `ps -ef|grep -v grep |grep nginx|wc -l` -ge 1 ]
#no.8 if [[ `curl -I -s -o /dev/null -w "%{http_code}\n" http://127.0.0.1` =~ [23]0[012] ]]
#no.9 if [ `curl -I http://127.0.0.1 2>/dev/null|head -1|egrep "200|302|301"|wc -l` -eq 1 ]
#no.10 if [ "`curl -s http://127.0.0.1`" = "数据字典" ] #根据访问网站的URL，将返回的结果和期待的值进行比较,咯麻烦.但是结果精确，适用于数据库及更深曾测的对网站集群后端各个应用的检测
  then
    echo "Nginx is Running"
  else 
    echo "Nginx is Stopped"
    #systemctl start nginx
fi
