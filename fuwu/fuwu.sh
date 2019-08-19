#!/bin/bash
path=/server/fuwu
[ ! -d "$path" ] && mkdir $path -p 

#ceshi 
cat <<END
    1.[install lamp]
    2.[install lnmp]
    3.[exit]
    Pls input the num you want:
END

read num
expr $num + 1 &>/dev/null
[ $? -ne 0 ] && {
   echo "the num you input must be {1|2|3}"
    exit 1
}

[ $num -eq 1 ] && {
    echo "start installing lamp."
    sleep 2;
    [ -x "$path/lamp.sh" ] || {
       echo "$path/lamp.sh does not exist or can not be exec."
       exit 2
}
    $path/lamp.sh
    # source $path/lamp.sh
    echo $?
}

[ $num -eq 2 ] && {
    echo "start installing lnmp."
    sleep 2;
    [ -x "$path/lnmp.sh" ] || {
       echo "$path/lnmp.sh does not exist or can not be exec."
       exit 4
}
    $path/lnmp.sh
    # source $path/lnmp.sh
    echo $?
}

[ $num -eq 3 ] && {
    echo bye
    exit 4
}

[[ ! $num =~ [1-3] ]] && {
    echo "the num you input must be {1|2|3}"
    echo "Input ERROR"
    exit 5
}
