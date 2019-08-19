#!/bin/bash
COLOR='\E[47;30m'
RES='\E[0m'

for num1 in `seq 9`
  do
    for num2 in `seq 9`
      do
        if [ $num1 -ge $num2 ]
          then
            if (((num1*num2)>9))
              then
                echo -en "${COLOR}${num1}x${num2}=$((num1*num2))$RES "
              else
                echo -en "${COLOR}${num1}x${num2}=$((num1*num2))$RES  "
            fi
          fi
         done
     echo " "
  done  
