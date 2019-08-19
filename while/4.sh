#!/bin/bash
total=0
export LANG="zh_CN.UTF-8"
NUM=$((RANDOM%61))
echo "当前苹果的价格是每斤$NUM元"
echo "========================="
usleep 1000000
clear
echo '这苹果多少钱一斤？
      请猜0~60的数字'
apple (){
read -p "请输入你的价格:" PRICE
  expr $PRICE + 1 &>/dev/null
  if [ $? -ne 0 ]
    then
      echo "猜数字"
      apple
  fi
}

guess () {
  ((tatal++))
    if [ $PRICE -eq $NUM ]
      then
        echo "猜对了，就是$NUM元"
      if [ $total -le 3 ]
        then
          echo "一共猜了$taotal次，牛"
        elif [ $total -gt 3 -a $total -le 6 ]
          then
            echo "一共猜了$total次，加油"
          elif [ $total -gt 6 ]
            then
              echo "一共猜了$total,太多了"
       fi
       exit 0
       elif [ $PRICE -gt $NUM ]
         then
           echo "有点高"
           echo "再来"
           apple
         elif [ $PRICE -lt $NUM ]
           then
             echo "有点低"
             echo "再来呗:"
             apple
    fi
}

main () {
  apple
  while true
  do
    guess
  done
}
main
 

