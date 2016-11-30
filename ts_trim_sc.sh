#!/usr/bin/env bash
#
# ts_trim_sc.sh
# @author acrazing
# @since 2016-11-29 14:39:36
# @desc ts_trim_sc.sh
#
__intro__="Remove the end semicolons for import statement in '.ts(x?)' files"
__help__="`basename $0` [all]
    If not set param all, will only check files that changed,
    or will check all files
"

. "`dirname $0`/funcs.sh"

set -xe

if [ "$1" == "all" ]; then
    find ./src -type f -name '*.ts' | xargs sed -i '' -E 's/^(( *import .*)|(.* from .*));$/\2\3/g'
    find ./src -type f -name '*.tsx' | xargs sed -i '' -E 's/^(( *import .*)|(.* from .*));$/\2\3/g'
else
    git st -s | grep -E '.*tsx?$' | sed -E 's/^.{3}(.* -> )?//' | xargs -I % bash -c "if [ -f % ]; then sed -i '' -E 's/^(( *import .*)|(.* from .*));$/\2\3/' %; fi"
fi

