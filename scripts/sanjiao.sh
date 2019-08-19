#!/bin/bash
if (test -z $1); then  #判断传参的值长度不是为0，如果没有传入参数，即使用read读入
  read -p "Input Max Lines:" MAX   #读入一个数值
else
    MAX=$1
fi   #既可以传参输入也可以read读入
i=1
while [ $i -le $MAX ]
  do
    j=1
    while [ $j -le $i ]
      do
        f=$[i-1]
        g=$[j-1]
        if [ $j -eq $i ] || [$j -eq 1 ]
          then
            declare SUM_${i}_$j=1
          else
            declare A=$[SUM_${f}_$j]
            declare B=$[SUM_${f}_$g]
            declare SUM_${i}_$j=`expr `$A + $B`
        fi
          echo -en $[SUM_${i}_$j]" "
          let j++
      done
      echo 
      let i++
  done
