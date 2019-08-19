#!/bin/bash
if [ -f /etc/hosts ]
  then
    echo "[1]"
fi

if [[ -f /etc/hosts ]]
  then
    echo "[[1]]"
fi

if test -f /etc/hosts
  then
    echo "test1"
fi
