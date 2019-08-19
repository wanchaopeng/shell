#!/bin/bash
echo -n "Pls input a char"
read var
[ "$var" == "1" ] && {
    echo 1
    exit 0
}
[ "$var" == "2" ] && {
    echo 2
    echo 0
}
[ "$var" != "2" -a "$var" != "1" ] && {
    echo error
    exit 0
}
