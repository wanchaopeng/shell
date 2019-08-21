#!/bin/bash
select name in `ls /tmp/test`
  do
    echo $name
  done
