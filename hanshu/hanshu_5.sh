#!/bin/bash
. /etc/init.d/functions
function usage () {
  echo $"usage:$0 url"
  exit 1
}

function check_url () {
  wget --spider -q -o /dev/null --tries=1 -T 5 $1
    if [ $? -eq 0 ]
      then
        action "$1 is yes." /bin/true
      else 
        action "$1 is no." /bin/false
    fi
}

function main() {
  if [ $# -ne 1 ]
    then
      usage
  fi
  check_url $1
}
main $*
