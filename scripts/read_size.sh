#!/bin/bash
read -t 15 -p "please two number:" a b
[ ${#a} -le 0 ] &&{ #利用表达式，根据变量值的长度是否小于0，来确定第一个数是否为空。
  echo "the first num is null"
  exit 1
}
[ ${#b} -le 0 ] && { 
  echo "then second num is null"
  exit 1
}
expr $a + 1 &>/dev/null
  RETVAL_A=$?
expr $b + 1 &>/dev/null
  RETVAL_B=$?
  if [ $RETVAL_A -ne 0 -o $RETVAL_B -ne 0 ]; then
       echo "one of the num is not num,pls input again."
       exit 1
  fi
  echo "a-b=$(($a-$b))"
  echo "a+b=$(($a+$b))"
  echo "a*b=$(($a*$b))"
  echo "a/b=$(($a/$b))"
  echo "a**b=$(($a**$b))"
  echo "a%b=$(($a%$b))"
