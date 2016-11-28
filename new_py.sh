#!/usr/bin/env bash
#
# new_py.sh
# @author acrazing
# @since 2016-11-09 11:44:11
# @desc
#
__intro__="Create python3 style files"
__help__="`basename $0` <...files>"
. "`dirname $0`/funcs.sh"

cwd=`pwd`
for file in $@
do
    dir=`dirname $file`
    name=`basename $file`
    mkdir -p $dir
    cd $dir
    echo "#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# @author `user` - `email`
# @version 1.0.0
# @since $now
#
# $name
#
" > $name
    chmod +x $name
    try_add_file.sh "$name"
    cd $cwd
done
