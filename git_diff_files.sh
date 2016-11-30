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

files="$(git st -s | grep -E '^[^D]{3}' | sed -E 's/^.{3}(.* -> )?//')"

if [ $# -gt 0 ]; then
    echon "$files" | grep "$@"
else
    echon "$files"
fi
