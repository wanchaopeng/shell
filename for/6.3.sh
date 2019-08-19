#!/bin/bash
PATH="/usr/local/mysql/bin:$PATH"
DBPATH=/data/backup
MYUSER=root
MYPASS=123456
SOCKET=/tmp/mysql.sock
MYCMD="mysql -u$MYUSER -pMYPASS -S $SOCKET"
MYDUMP="mysqldump -u$MYUSER -pMYPASS -S $SOCKET"
for dbname in shunmai langwenke haibei guirentong
  do
    $MYCMD -e "use $dbname;create  table test (id int,name varchar(16)); insert into test values(1,'testdata');"
  done 
