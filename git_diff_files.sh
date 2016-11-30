#!/usr/bin/env bash
#
# git_diff_files.sh
# @author acrazing
# @since 2016-11-29 15:09:49
# @desc git_diff_files.sh
#

__intro__="Get changed and exists files for git"
__help__="`basename $0` [filter]
    If filter is set, will use this to filter file list
    The filter format is regex
"

. "`dirname $0`/funcs.sh"


if [ $# -gt 0 ]; then
    git st -s | sed -E 's/^.{3}(.* -> )?//' | grep -E "$@"
else
    git st -s | sed -E 's/^.{3}(.* -> )?//'
fi
