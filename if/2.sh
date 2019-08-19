#!/bin/bash
FreeMem=`free -m|awk 'NR==2{print $4}'`
CHARS="Current memory is $FreeMem"

if [ $FreeMem -gt 100 ]
  then $CHARS|tree /tmp/messages.txt
  mail -s "`date +%F-%T`$CHARS" chaopeng.wan@yunfangtan.com < /tmp/messages.txt
fi

