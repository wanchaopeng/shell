#!/bin/bash
a=$1
b=$2

#no.1 judge arg nums.
if [ $# -ne 2 ]
  then
    echo "USAGE:$0 arg1 arg2"
    exit 2
fi

#no.2 judge if int
expr $a + 1 &>/dev/null
RETVAL1=$?
expr $b + 1 &>/dev/null
RETVAL2=$?
  if [ $RETVAL1 -ne 0 -a $RETVAL2 -ne 0 ]
    then
      echo "please input two int again"
      exit 3
  fi

#no.3 compart two num
    if [ $a -lt $b ]
      then
        echo "$a<$b"
      elif [ $a -gt $b ]
        then
          echo "$a>$b"
       else 
         echo "$a=$b"
    fi
