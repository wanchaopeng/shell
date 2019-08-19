#!/bin/bash
cd /server/test
for file in `ls *.sh`
  do
    mv $file `echo $file|sed 's#.1##g'`
  done
