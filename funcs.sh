#!/usr/bin/env bash
#
# funcs.sh
# @author acrazing
# @since 2016-11-26 19:57:49
# @desc
#
set -e

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

pe() {
    if [ -t 1 ]; then
        echo -e "\033[31m$@\033[0m"
    else
        echo "$@"
    fi
}

pw() {
    if [ -t 1 ]; then
        echo -e "\033[33m$@\033[0m"
    else
        echo "$@"
    fi
}

pb() {
    if [ -t 1 ]; then
        echo -e "\033[1m$@\033[0m"
    else
        echo "$@"
    fi
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
    exit 0
}

args "$@"

