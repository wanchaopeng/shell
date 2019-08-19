#!/bin/bash
cat <<END
    1.shunmai
    2.langwenke
    3.youxiang
END

read -p "Which do you like?Pls input the num:" a
[ "$a" = "1" ] && {
    echo "I guess,you worker shunmai"
    exit 0
}

[ "$a" = 2 ] && {
    echo "I guess, you worker langwenke"
    exit 0
}

[ "$a" = 3 ] && {
    echo "I guess,you worker youxiang"
    exit 0
}

[[ ! "$a" =~ [1-3] ]] && {
    echo "I guess,you not worker."
}
