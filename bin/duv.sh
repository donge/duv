#!/bin/sh
if [ -z "$1" ];then
    echo "no param";
    exit 1;
fi
time=`date`;
echo $time;

du -s * | sort -n -r | head -n 20 | /homes/dongdong/bin/gawk '
        BEGIN { ORS = ""; print "{ \"time\": \"'"$time"'\",\"name\": \"'$1'\", \"data\":[ "}
        /Filesystem/ {next}
        { printf "%s{\"size\": \"%s\", \"name\": \"%s\"}",
              separator, $1, $2
          separator = ", "
        }
        END { print " ] }" }
    ' > $HOME/public_html/top/$1.json
