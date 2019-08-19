#!/bin/bash
[ $# -ne 2 ] && {
    echo $"USAGE $0 NUM1 NUM2"
    exit 1
}

a=$1
b=$2
expr $a + $b + 2 &>/dev/null
  if [ $? -ne 0 ]
    then
      echo "you must input two nums."
      exit 2
fi

echo "a-b=$(($a-$b))"
echo "a+b=$(($a+$b))"
echo "a+b=$(($a*$b))"
echo "a+b=$(($a/$b))"
echo "a+b=$(($a**$b))"
echo "a+b=$(($a%$b))"
