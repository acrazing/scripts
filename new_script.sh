#!/usr/bin/env bash
#
# new_script.sh
# @author acrazing
# @since 2016-11-27 10:13:09
# @desc
#
__help__="`basename $0` <script name> [env=bash]
    For example:
        \``basename $0` hello/world.sh\`
        will create a file \`world.sh\` under ./hello directory
        with shebang and some useful comments"
__intro__="create a shell style file and add execute permission"
. "`dirname $0`/funcs.sh"

ENV=${2:-bash}

file=`basename $1`

cd "`dirname $1`"

echo "#!/usr/bin/env ${ENV}
#
# $file
# @author `user`
# @since $now
# @desc $file
#
" > "$file"
chmod +x "$file"
call try_add_file.sh "$file"
