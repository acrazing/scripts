#!/usr/bin/env bash
#
# install.sh
# @author acrazing
# @since 2016-11-26 19:26:26
# @desc
#

. "$(dirname $0)/funcs.sh"

__intro__="Install scripts to your machine"
__help__="$0"

args "$@"

filename="$(basename $0)"

if [ "$(which $filename)" != "" ]; then
    warn "Already installed, run help.sh to get installed commands!"
    exit 0
fi

cd "$(dirname $0)"

if [ "$(cat ~/.bash_profile | grep $(pwd) | wc -l)" -gt 0 ]; then
    error "You have already installed scripts, please restart your shell and do not install twice!"
fi

echo "
export PATH=$(pwd):\$PATH
" >> ~/.bash_profile
. ~/.bash_profile

if [ "$(which $filename)" == "" ]; then
    error "Install failed, please check your ~/.bash_profile file content!"
fi

warn "Scripts installed, please restasrt your terminal or run . ~/.bash_profile to load scripts in current terminal"
info "You can run help.sh to get installed commands list!"
