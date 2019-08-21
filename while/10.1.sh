#!/bin/bash
array=(shunmai langwenke youxiang yougou)
select name in "${array[@]}"
  do
    echo $name
  done
