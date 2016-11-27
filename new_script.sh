#!/usr/bin/env bash
#
# new_script.sh
# @author acrazing
# @since 2016-11-27 10:13:09
# @desc
#
__help__="`basename $0` <script name> [env=bash]"
__intro__="create a shell style file and add execute permission"
. "`dirname $0`/funcs.sh"

ENV=${2:-bash}

echo "#!/usr/bin/env ${ENV}
#
# `basename $1`
# @author $user
# @since $now
# @desc `basename $1`
#
" > "$1"
chmod +x "$1"
try_add_file.sh "$1"
