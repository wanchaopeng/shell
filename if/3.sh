#!/bin/bash
read -p "Pls input two num:" a b

if [ $a -lt $b ]
  then
    echo "yes,$a less than $b"
    exit 0
fi

if [ $a -gt $b ]
  then 
    echo "yes.$a greater than $b"
    exit 0
fi
