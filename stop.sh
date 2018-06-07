#!/usr/bin/env bash
#
# kill9.sh
# @author acrazing
# @since 2017-09-05 13:59:43
# @desc kill9.sh
#

__intro__="kill a process use SIGKILL"
__help__="$(basename $0) regex"

. "$(dirname $0)/funcs.sh"

ps aux | grep -iE "$1" | awk '{print $2}' | xargs kill -KILL
