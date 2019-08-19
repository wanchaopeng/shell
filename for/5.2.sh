#!/bin/bash
i=0
while ((i<=100))
  do 
    ((j=j+i))
    ((i++))
done
echo $j
