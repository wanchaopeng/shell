#!/bin/bash
read -p "please input a number:" ans
if [ $ans -eq 1 ]
  then
    echo "the num you input is 1"
  elif [ $ans -eq 2 ]
    then
      echo "the num you input is 2"
    elif [ $ans -ge 3 -a $ans -le 9 ]
      then
        echo "the num you input is $ans"
      else 
        echo "the num you input must be [1-9]"
        exit
fi
