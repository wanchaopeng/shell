#!/bin/bash
a=$1
b=$2

#no1
[ -z "$a" ]||[ -z "$b" ] && {
    echo "Pls input two num again."
    exit 1
}

#no2
expr $a + 10 &>/dev/null
  RETVAL1=$?
expr $b + 10 &>/dev/null
  RETVAL2=$?
    test $RETVAL1 -eq 0 -a  $RETVAL2 -eq 0 || {
        echo "Pls input two num again."
        echo 2
}

#no3
[ $a -eq $b ] && {
  echo "$a = $b"
  exit 0
}

#no.4
[ $a -gt $b ] && {
  echo "$a > $b"
  exit 0
}

#no.5
[ $a -lt $b ] && {
  echo "$a < $b"
  exit 0
}


