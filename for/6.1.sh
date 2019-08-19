#!/bin/bash
PATH="/usr/local/mysql/bin:$PATH"
MYUSER=root
MYPASS=123456
SOCKET=/tmp/mysql.sock
MYCMD="mysql -u$MYUSER -p$MYPASS -S $SOCKET"
for dbname in shunmai langwenke guirentong
  do 
    $MYCMD -e "create dabases dbname"
  done
