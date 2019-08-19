#!/bin/bash
read -t 15 -p "please input two number:" a b
echo "a-b=$(($a-$b))"
echo "a+b=$(($a+$b))"
echo "a+b=$(($a*$b))"
echo "a+b=$(($a/$b))"
echo "a+b=$(($a**$b))"
echo "a+b=$(($a%$b))"
