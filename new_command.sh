#!/usr/bin/env bash
#
# new_command.sh
# @author acrazing
# @since 2016-10-18 15:58:17
# @desc
#
__help__="`basename $0` <script name> [env=bash]"
__intro__="Create a script file under the installed directory as a global command, and open it by vim"
. "`dirname $0`/funcs.sh"

call new_script.sh "$(dirname $0)/$(basename $1)" "$2"
vim "$(dirname $0)/$(basename $1)"

