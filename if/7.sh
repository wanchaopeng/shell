#!/bin/bash
echo method4-----------------------
if [ `lsof -i tcp:3306|wc -l ` -gt 0 ] 
  then
    echo "MYSQL is Running"
  else 
    echo "MYSQL is Stopped"
fi
