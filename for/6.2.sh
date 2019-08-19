#!/bin/bash
PATH="/usr/local/mysql/bin:$PATH"
DAPATH=/data/backup
MYUSER=root
MYPASS=123456
SOCKET=/tmp/mysql.sock
MYCMD="mysql -u$MYUSER -pMYPASS -S $SOCKET"
MYDUMP="mysqldump -u$MYUSER -pMYPASS -S $SOCKET"
[ ! -d "$DAPATH" ] && mkdir $DAPATH
for dbname in `$MYCMD -e "show databases;"|sed '1,2d'`|egrep -v "mysql|test"
  do
    $MYDUMP $dbname |gzip >$DAPATH/${dbname}_$(date +%F).sql.gz
  done
