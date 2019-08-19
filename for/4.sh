#!/bin/bash
cd /server/test
for filename in `ls|grep "sh$"`
  do
    mv $filename `echo $filename|cut -d . -f1`.1.sh
  done
