#!/bin/bash
rm -rf /tmp/user.log
for i in `seq -w 10`
  do
    useradd shunmai$i && \
    echo "echo $RANDOM|md5sum|cut -c 1-8"|passwd --stdin shunmai$i
    echo -e "user:shunmai$i \t pass:`echo $RANDOM|md5sum|cut -c 1-8`" >>/tmp/user.log
  done
