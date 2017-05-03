#!/usr/bin/env bash
#
# git_alias.sh
# @author acrazing
# @since 2016-12-01 14:53:53
# @desc git_alias.sh
#
__intro__="Set git short alias"
__help__="`basename $0`
    This only need to run once, after do it, you
    can use \`git config --list --global | grep alias.\`
    to get all alias

    Currently, this command will set follow alias:

    st:   shortcut for status
    alog: shortcut to print commit history in online, hide merge commit
    mlog: shortcut to print commit history in online, show merge commit
    ci:   shortcut for commit
    co:   shortcut for checkout
    b:    shortcut for branch
    "

. "`dirname $0`/funcs.sh"

set +e
git config --global --unset-all alias.st
git config --global --unset-all alias.alog
git config --global --unset-all alias.mlog
git config --global --unset-all alias.ci
git config --global --unset-all alias.co
git config --global --unset-all alias.b

git config --global --add alias.st status
git config --global --add alias.alog "log --graph --decorate --date=format:'%m-%d %H:%M' --pretty=format:'%ad %C(cyan)%h%C(reset) %s %C(yellow)%an<%ae>%Creset%C(auto)' --no-merges"
git config --global --add alias.mlog "log --graph --decorate --date=format:'%m-%d %H:%M' --pretty=format:'%ad %C(cyan)%h%C(reset) %s %C(yellow)%an<%ae>%Creset%C(auto)'"
git config --global --add alias.ci commit
git config --global --add alias.co checkout
git config --global --add alias.b branch

pw "Alias set result as follow:"
git config --global --list | grep alias.
