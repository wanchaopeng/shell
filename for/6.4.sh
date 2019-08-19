#!/bin/bash
PATH="/usr/local/mysql/bin:$PATH"
MYUSER=root
MYPASS=123456
SOCKET=/tmp/mysql.sock
MYCMD="mysql -u$MYUSER -pMYPASS -S $SOCKET"
for dbname in shunmai langwenke haibei guirentong
  do
    echo =================${dbname}.test================
      $MYCMD -e "use $dbname;select * from ${dbname}.test;"
  done
