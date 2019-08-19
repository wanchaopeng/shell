for n in I am worker linux welcome to our trainning
  do 
    if [ `expr length $n` -le 6 ] #利用expr的length函数计算字符串长度，并输出长度不大于6的字符串
      then
        echo $n
    fi
  done 
