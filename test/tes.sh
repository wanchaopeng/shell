#!/bin/bash
[ -f /etc ] || {
    echo 1  #如果/etc/是普通文件不成立，则执行大括号里的命令集合
    echo 2
    echo 3
}
