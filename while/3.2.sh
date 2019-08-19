#!/bin/bash
i=1
sum=0
while ((i<=100))
do
  ((sum=sum+i))
  ((i++))
done
[ "$sum" -ne 0 ] && printf "totalsum is: $sum\n"
