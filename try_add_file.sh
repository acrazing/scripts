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

cd $(dirname $1)
set +e
svn info 2>/dev/null 1>/dev/null
if [ $? == 0 ]; then
    cmd=svn
fi
git status 2>/dev/null 1>/dev/null
if [ $? == 0 ]; then
    cmd=git
fi
if [ "$cmd" == "" ]; then
    warn "Cannot find vcs, please check your file is under a vcs directory!"
fi

cwd=`pwd`
for file in $@
do
    if [ "$cmd" == "git" ] && [ "$(git check-ignore $file)" != "" ]; then
        continue
    fi
    cd "`dirname $file`"
    $cmd add "`basename $file`"
    cd $cwd
done
