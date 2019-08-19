#!/bin/bash
RED_COLOR='\E[1;31m'
GREEN_COLOR='\E[1;32m'
YELLOW_COLOR='\E[1;33m'
BLUE_COLOR='\E[1;34m'
RES='\E[0m'
menu () {
cat <<END
1.apple
2.pear
3.banana
END
}

menu
read -p "Pls input your choice:" fruit
case "$fruit" in
1)
    echo -e "${RED_COLOR}apple${RES}"
    ;;
  2)
    echo -e "${GREEN_COLOR}pear${RES}"
    ;;
  3)
    echo -e "${YELLOW_COLOR}banana${RES}"
    ;;
  4)
    echo -e "${BLUE_COLOR}cherry${RES}"
    ;;
  *)
    echo -e “muse be {1|2|3|4}”
esac
