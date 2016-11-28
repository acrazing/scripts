#!/usr/bin/env bash
#
# try_add_file.sh
# @author acrazing
# @since 2016-09-07 10:22:55
# @desc
#
__help__="`basename $0` <...files>"
__intro__="Automaticly add file to vcs for svn/git"
. "$(dirname $0)/funcs.sh"

cwd="`pwd`"
for file in "$@"
do
    dir=`dirname "$file"`
    name=`basename "$file"`
    cd "$dir"
    set +e
    svn info 2>/dev/null 1>/dev/null
    if [ $? == 0 ]; then
        cmd=svn
    fi
    git status 2>/dev/null 1>/dev/null
    if [ $? == 0 ]; then
        cmd=git
    fi
    set -e
    if [ "$cmd" == "" ]; then
        pw "Cannot find vcs, please check your file is under a vcs directory!"
        cd "$cwd"
        continue
    fi

    if [ "$cmd" == "git" ] && [ "$(git check-ignore \"$name\")" != "" ]; then
        cd "$cwd"
        pw "This file is ignored by .gitignore file, could not add to vcs!"
        continue
    fi
    $cmd add "$name"
    cd "$cwd"
done
