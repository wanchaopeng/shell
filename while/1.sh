#!/bin/bash
while [ 1 ]
do
  uptime >>/tmp/uptime.log
  usleep 2000000
done
