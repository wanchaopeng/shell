#!/bin/bash
read -p "please input a number:" ans
case "$ans" in
    1)
      echo "The num you input is 1"
      ;;
    2)
      echo "The num you input is 2"
      ;;
    [3-9])
      echo "The num you input is $ans"
      ;;
    *)
      echo "please input [0-9] int"
      exit;
esac
