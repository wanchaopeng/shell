#!/bin/bash
read -p "Pls inpput two num:" a b
  if [ $a -lt $b ]
    then 
      echo "yes,$a less than $b"
    elif [ $a -eq $b ]
      then
        echo "yes,$a greater than $b"
      else [ $a -gt $b ]
        echo "yes,$a greater than $b"
  fi      
