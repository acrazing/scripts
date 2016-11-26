#!/usr/bin/env bash
#
# funcs.sh
# @author acrazing
# @since 2016-11-26 19:57:49
# @desc
#
set -e

__help__="util functions for other shell commands"
__intro__="util functions"

help() {
    if [ $# -gt 0 ]; then
        echo -e "\033[31mERROR: $@\033[0m"
        echo
    fi
    echo -e "\033[1m$(basename $0)\033[0m
    $__intro__

\033[1mUsage\033[0m:
    $__help__
"
    if [ $# -gt 0 ]; then
        exit 1
    else 
        exit 0
    fi
}

args() {
    case $1 in
        -h)
            help
            ;;
        --help)
            help
            ;;
        -i)
            echo $__intro__
            exit 0
            ;;
        --intro)
            echo $__intro__
            exit 0
            ;;
    esac
}

error() {
    echo -e "\033[31m$@\033[0m"
    exit 1
}

info() {
    echo "$@"
    exit 0
}

warn() {
    echo -e "\033[33m$@\033[0m"
}

if [ "$BASH_SOURCE" == "$0" ]; then
    args "$@"
fi

