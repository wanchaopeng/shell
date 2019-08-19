#!/bin/bash
i=5
until [[ $i < 1 ]]
  do 
    echo $i
    ((i--))
  done
