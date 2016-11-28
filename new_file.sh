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

pwd=$PWD
for i in $@
do
    dir=$(dirname $i)
    name=$(basename $i)
    mkdir -p $dir
    cd $dir 

    echo "/*!
 *
 * Copyright $(date "+%Y") - `user`
 *
 * @author `user` `email`
 * @since $now
 * @version 1.0.0
 * @desc $name
 */

" > $name


if [ $(echo $name | grep -E 'tsx$' | wc -l) -gt 0 ]; then
    echo "import * as React from 'react'

" >> $name
fi

    try_add_file.sh $name

    cd $pwd
done
