#!/bin/bash
PS3="please select a num from menu:"

select name in shunmai langwenke youxiang yougou
  do 
    echo -e "I guess you selected the menu is:\n $REPLY) $name"
  done
