#!/bin/bash
PATH="/usr/local/mysql/bin:$PATH"
DBPATH=/data/backup
MYUSER=root
MYPASS=123456
SOCKET=/tmp/mysql.sock
MYCMD="mysql -u$MYUSER -pMYPASS -S $SOCKET"
MYDUMP="mysqldump -u$MYUSER -pMYPASS -S $SOCKET"
  [ ! -d "$DAPATH" ] && mkdir $DBPATH
  for dbname in `$MYCMD -e "show databases;"|sed '1,2d'|egrep -v "mysql|schema"`
    do
      mkdir $DBPATH/${dbname}_$(date +%F) -p
      for table in `$MYCMD -e "show tables from $dbname;"|sed '1d'`
        do
          $MYCMD $dbname $table|gzip >$DBPATH/${dbname}_$(date +%F)/${dbname}_$(table).sql.gz
        done
    done
