#!/bin/bash
function usage () {
  echo $"usage:$0 url"
  exit 1
}

function check_url () {
  wget --spider -q -o /dev/null --tries=1 --timeout=5 $1
  if [ $? -eq 0 ]
    then
      echo "$1 is yes."
    else 
      echo "$1 is no."
  fi 
}

function main () {
  if [ $# -ne 1 ]
    then
      usage
  fi
  check_url $1
}

main $*
