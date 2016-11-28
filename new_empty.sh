#!/usr/bin/env bash
#
# new_empty.sh
# @author acrazing
# @since 2016-11-28 14:45:11
# @desc new_empty.sh
#

__intro__="Create empty files and add to vcs"
__help__="`basename $0` <...files>"
. "`dirname $0`/funcs.sh"

root="`pwd`"

for file in "$@"
do
    dir=`dirname "$file"`
    name=`basename "$file"`
    mkdir -p "$dir"
    cd "$dir"
    touch "$name"
    call try_add_file.sh "$name"
    cd "$root"
done

