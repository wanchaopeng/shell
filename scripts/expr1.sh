#!/bin/bash
if expr "$1" : ".*\.pub" &>/dev/null
  then
    echo "you are using $1"
  else
    echo "pls use *.pub file"
fi
