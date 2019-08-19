#!/bin/bash
path=/server/for/
MAIL_GROUP="111111@qq.com 222222@qq.com"
PAGER_GROUP="12345678999 23411345678"
LOG_FILE="/tmp/web_check.log"
[ ! -d "$path" ] && mkdir -p $path

function urlist () {
  cat >$path/domain.list<<EOF
  http://www.langwenke.com
  http://m.langwenke.com
  http://testm.langwenke.com
  http://172.17.15.87
EOF
}

function checkurl () {
  FAILCOUNT=0
  for ((i=1;$i<=3;i++))
  do
    wget -T 5 --tries=1 --spider $1 >/dev/null 2>&1
      if [ $? -ne 0 ]
        then
          let FAILCOUNT+=1;
        else
          break
      fi
  done 
  return $FAILCOUNT
}

function MAIL () {
  local SUBJECT_CONTENT=$1
  for MAIL_USER in `echo $MAIL_GROUP`
    do
      mail -s "$SUBJECT_CONTENT " $MAIL_USER <$LOG_FILE
    done
}

function PAGER (){
  for PAGER_USER in `echo $PAGER_GROUP`
    do
      TITLE=$1
      CONTACT=$PAGER_USER
      HTTPGW=http://www.langwenke.com
      #send_message method1
      curl -d cdkey=5ADF-EFA -d password=OLDBOY -d phone=$CONTACT -d message="$title[$2]" $HTTPGW
    done
}
function sendmsg () {
  if [ $1 -ge 3 ]
    then
      NOW_TIME=`date +"%Y-%m-%d %H:%M:%S"`
      SUBJECT_CONTENT="http://$2 is error,${NOW_TIME}."
      echo -e "$SUBJECT_CONTENT"|tee $LOG_FILE
      MAIL $SUBJECT_CONTENT
      PAGER $SUBJECT_CONTENT  $NOW_TIME
    else
      echo "http://$2 is ok"
      RETVAL=0
  fi
  return $RETVAL
}

function main () {
  urlist
  for url in `cat $path/domain.list`
    do
      checkurl $url
      sendmsg $? $url
    done
}
main
  
      
