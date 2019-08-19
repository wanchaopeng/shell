sum=1000
i=15
while ((sum>=i))
  do
    ((sum=sum-i))
      [ $sum -lt $i ] && {
        echo "send message,left $sum money is not enough"
        break
      }
      echo "send message,left $sum"
  done
