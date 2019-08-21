#!/bin/bash
RETVAR=0
path=/server/whiles
[ ! -d "$path" ] && mkdir $path -p

function Usage () {
  echo "Usage:$0 argv"
  return 1
}

function InstallService () {
  if [ $# -ne 1 ]
    then
      Usage
  fi
  local RETVAR=0
  echo "start installing ${1}."
  sleep 2;
  if [ ! -x "$path/${1}.sh"]
    then
      echo "$path/${1}.sh does not exist or can not be exec."
        return 1
    else
      $path/${1}.sh
      return $RETVAR
  fi
}

function main () {
  PS3="`echo pls input the num you want:`"
  select var in "Install lamp" "Install lnmp" "exit"
    do
      case "$REPLY" in
        1)
           InstallSercice lamp
           RETVAR=$?
           ;;
        2)
           InstallService lnmp
           RETVAR=$?
           ;;
        3)
           echo bye.
           return 3
           ;;
        *)
          echo "the num you input must be {1|2|3}"
            echo "Input ERROR"
      esac
    done
  exit $ RETVAR
}

main
