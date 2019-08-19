#!/bin/bash
if [[ `expr match "$1" "[0-9][0-9]*$"` == 0 ]]
  then
    echo "$1 is not a num"
  else
    echo "$1 is a num"
fi
