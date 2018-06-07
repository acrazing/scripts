#!/usr/bin/env bash
#
# init_file_js.sh
# @author acrazing
# @since 2016-02-23 18:09:02
# @desc
#
__intro__="Create c style files"
__help__="`basename $0` <...filename>
    For example:
        `basename $0` src/index.tsx src/index.c src/index.cc
        will create three files under src directory, and add c style file
        comment to the file, and try to add it to vcs(git/svn)
        if the filename endswith .tsx, will auto add import react line"
. "`dirname $0`/funcs.sh"

function go_package() {
    for file in ./*.go; do
        name=$(grep -o -E '^package .+$' $file | awk -F ' ' '{print $2}')
        if [ "$name" != "" ]; then
            echo $name
            return
        fi
    done
    echo $(basename $(realpath .))
}

function go_full_package() {
    echo "$(realpath --relative-to=$GOPATH/src .)"
}

if [ "$1" == "+x" ]; then
    GX="X"
    shift
else
    GX=""
fi

pwd=$PWD
for i in $@
do
    mkdir -p $(dirname $i)
    touch $i
    dir=$(dirname $(realpath $i))
    name=$(basename $i)
    cd $dir
    X=$GX
    copy="Copyright $(date "+%Y") $(user) <$(email)>. All rights reserved."
    case $name in
        *.go)
            content="// $copy\n// Since $now\npackage $(go_package)"
            ;;
        *.proto)
            content="// $copy
// Since $now
syntax = \"proto3\";
package $(go_package);

import \"github.com/gogo/protobuf/gogoproto/gogo.proto\";

option (gogoproto.goproto_getters_all) = false;
option go_package = \"$(go_full_package)\";"
            ;;
        *.py)
            content="#!/usr/bin/env python3\n# -*- coding: utf-8 -*-\n# $copy\n# @since $now"
            X="X"
            ;;
        *.sh)
            content="#!/usr/bin/env bash\n# $copy\n# @since $now"
            X="X"
            ;;
        *.md)
            content="#"
            ;;
        *)
            content="/*!\n * $copy\n * @since $now\n */"
            ;;
    esac
    case $name in
        *.tsx)
            content="$content\n\nimport * as React from 'react'"
            ;;
    esac
    echo -e "$content" > $name
    try_add_file.sh $name
    if [ "$X" == "X" ]; then
        chmod +x $name
    fi
    cd $pwd
done
