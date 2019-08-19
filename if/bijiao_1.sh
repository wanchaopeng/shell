#!/bin/bash
read -p "Pls input two num:" a b

#no.2 judge if int
expr $a + 1 &>/dev/null
RETVAL1=$?
expr $b + 1 &>/dev/null
RETVAL2=$?

if [ -z "$a" ] || [ -z "$b" ]
  then 
    echo "Pls input two num agagin."
    exit 1
  elif test $RETVAL1 -ne 0 -o $RETVAL2 -ne 0
    then
      echo "Pls input two num agagin."
      exit 2
    elif [ $a -lt $b ]
      then
        echo "$a < $b"
      elif [ $a -eq $b ]
        then
          echo "$a = $b"
        else 
          echo "$a > $b"
fi 
exit 0
