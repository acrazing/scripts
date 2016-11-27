#!/usr/bin/env bash
#
# help.sh
# @author acrazing
# @since 2016-11-26 20:28:04
# @desc
#

__intro__="Get all installed commands on your machine"
__help__=`basename $0`

cd `dirname $0`
. ./funcs.sh

cmds="$(find ./ -type f | grep -v '/\.')"

pw Commands:

for cmd in $cmds
do
    if [ -x $cmd ]; then
        if [ -t 1 ]; then
            echo -e "\033[1m$(basename $cmd)\033[0m: $($cmd -i)"
        else
            echo "$(basename $cmd): $($cmd -i)"
        fi
    fi
done

