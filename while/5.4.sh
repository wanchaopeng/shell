#!/bin/bash
TOTAL=500
MSG_FEE=499
. /etc/init.d/functions

function is_num () {
  expr $1 + 1 &>/dev/null
  if [ $? -ne 0 -a "$1" != "-1" ]
    then
      return 1
  fi
      return 0
}

function color () {
RED_COLOR='\E[1;31m'
YELLOW_COLOR='\E[1;33m'
BLUE_COLOR='\E[1;34m'
PINK='\E[1;35m'
RES='\E[0m'
  if [ $# -ne 2 ]
    then
      echo "Usage $0 content {red|yellow|blue|pink}"
      exit 
  fi
  case "$2" in
    red|RED)
      echo -e  "${RED_COLOR}$1${RES}"
      ;;
    yellow|YELLOW)
      echo -e "${YELLOW_COLOR}$1${RES}"
      ;;
    blue|BLUE)
      echo -e "${BLUE_COLOR}$1${RES}"
      ;;
    PINK|pink)
      echo -e "${PINK}$1${RES}"
      ;;
    *)
    echo "Usage $0 content {red|yellow|blue|pink}"
    exit 
  esac
}

function consum () {
  color "You have left $TOTAL monmey,Send a msg need to charge $MSG_FEE money" yellow
  if [ $TOTAL -lt $MSG_FEE ]
    then
      charge
  fi
  read -p "Pls input your msg:" TXT
  read -p "Are you to send?[y|n]" OPTION
  case "$OPTION" in 
  [yY]|[Yy]|[e|E]|[sS])
     color "Send "$TXT" successfully!" yellow
     echo "$TXT" >>/tmp/consum.log
     ((TOTAL=TOTAL-MSG_FEE))
      color "Your have $TOTAL left!" yellow
      ;;
      [nN]|[nN]|[oO])
      echo "Canceled"
      ;;
      *)
      echo "Invalid Input,this msg doesnt send out"
      ;;
    esac
}

function charge () {
  if [ $TOTAL -lt $MSG_FEE ]
    then
      color "Money is not enough,Are U want to charge?[y|n]" red
      read OPT2
      case "$OPT2" in 
        y|Y)
          while true
            do
              read -p "How much are you want to charge?[INT]" CHARGE
              IS_NUM $CHARGE && break || {
              echo "INVALID INPUT"
              exit 100
}

done
((TOTAL+=CHARGE)) && echo "you have $TOTAL money."
  if [ $TOTAL -lt $MSG_FEE ]
    then
      charge
  fi
 ;;
 n|N)
  color "You have left $TOTAL money,can not send a msg,bye" red
  ;;
 *)
  charge
  ;;
 esac
 fi
}

main () {
  while [ $TOTAL -ge $MSG_FEE ]
  do
    consum
    charge
  done
}
main 

