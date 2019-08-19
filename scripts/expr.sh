#!/bin/bash
expr $1 + 1 >/dev/null 2>&1
  [ $? -eq 0 ] && echo int ||echo chars  #返回值为0，输出int,否则输出chars
