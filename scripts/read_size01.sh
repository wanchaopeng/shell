#!/bin/bash
a=$1
b=$2
Usage(){
  echo $"USAGE:sh $0 num1 num2"
  exit 1
}
if [ $# -ne 2 ]; then
   Usage
fi
expr $a + 1 >/dev/null 2>&1
[ $? -ne 0 ] && Usage
expr $b + 1 >/dev/null 2>&1 
  echo "a-b=$(($a-$b))"
  echo "a+b=$(($a+$b))"
  echo "a*b=$(($a*$b))"
  echo "a**b=$(($a**$b))"

if [ $b -eq 0 ]
  then
    echo "you input does not allow to run."
    echo "a/b =error"
    echo "a%b =error"
  else
    echo "a/b =$(($a/$b))"
    echo "$b =$(($a%$b))"
fi
