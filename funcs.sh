#!/usr/bin/env bash
#
# funcs.sh
# @author acrazing
# @since 2016-11-26 19:57:49
# @desc
#
set -e

user() {
    name="$(git config --get user.name | tr -d '[:space:]')"
    echo -n ${name:-`whoami`}
}

email() {
    name="$(git config --get user.email | tr -d '[:space:]')"
    echo -n $name
}

now="$(date '+%Y-%m-%d %H:%M:%S')"


__help__=${__help__:-"util functions for other shell commands"}
__intro__=${__intro__:-"util functions"}

help() {
    if [ $# -gt 0 ]; then
        pe "ERROR: $@"
        echo
    fi
    pb $(basename $0):
    echo "    $__intro__"
    echo
    pb Usage:
    echo "    $__help__"
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

call() {
    cmd="$1"
    shift
    if [ "$debug" == "debug" ]; then
        "$cmd" "--debug" "$@"
    else
        "$cmd" "$@"
    fi
}


pe() {
    if [ -t 1 ]; then
        echo -e "\033[31mERROR: $@\033[0m"
    else
        echo "$@"
    fi
}

pee() {
    pe "$@" 1>&2
}

pw() {
    if [ -t 1 ]; then
        echo -e "\033[33mWARN: $@\033[0m"
    else
        echo "$@"
    fi
}

pwe() {
    pw "$@" 1>&2
}

pb() {
    if [ -t 1 ]; then
        echo -e "\033[1m$@\033[0m"
    else
        echo "$@"
    fi
}

error() {
    pe "$@"
    exit 1
}

info() {
    echo "INFO: $@"
    exit 0
}

warn() {
    pw "$@"
    exit 0
}

args "$@"

if [ "$1" == "--debug" ]; then
    set -x
    debug=debug
    shift
fi
