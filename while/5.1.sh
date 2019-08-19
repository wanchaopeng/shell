#!/bin/bash
sum=1000
i=15
while (($sum>=i))
  do
    ((sum=sum-i))
    [ $sum -lt $i ] && break
    echo "send message,left $sum"
  done
  echo "money is not enough:$sum"
