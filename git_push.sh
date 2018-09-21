#!/usr/bin/env bash
# Copyright 2018 yangjunbao <yangjunbao@shimo.im>. All rights reserved.
# @since 2018-09-21 18:26:52
[ "1" = "0" ] && . ./_funcs.sh

__FILE__=$(basename $0)
__DIR__=$(dirname $0)
__intro__="commit changes to work tree and push it remote and change version for package.json"
__help__="$__FILE__ [args]"
__args__="
    v:version:none:string:1:1:the version to update to [patch,major,major,none]
    R:remote:origin:string:1:1:the remote name
    T:trunk:release:string:1:1:the trunk branch
    __:message::string:0:1:the commit message
"
OPT_trunk="release"
OPT_remote="origin"
OPT_version="none"
OPT_message=""
. "$__DIR__/_funcs.sh" "$@"
set -e

commit() {
    branch="$(git rev-parse --abbrev-ref HEAD)"
    if [ "$branch" = "HEAD" ]; then
        exit_error "You are not at a work branch, cannot commit"
    fi
    git add .
    git commit -m "$OPT_message"
    git_pull.sh --trunk "$OPT_trunk" --remote "$OPT_remote"
    git push -u origin "$branch"
    exit 0
}

if [ "$(git st -s)" == "" ]; then
    info "Nothing to commit"
    exit 0
fi

if [ ! -f package.json ]; then
    commit
fi

major=$(awk -F '"' '/version/{print $4}' package.json | awk -F '.' '{print $1}')
minor=$(awk -F '"' '/version/{print $4}' package.json | awk -F '.' '{print $2}')
patch=$(awk -F '"' '/version/{print $4}' package.json | awk -F '.' '{print $3}')

case "$OPT_version" in
    major)
        ((major++))
        minor=0
        patch=0
        ;;
    minor)
        ((minor++))
        patch=0
        ;;
    patch)
        ((patch++))
        ;;
    *)
        commit
        ;;
esac

OPT_message="v${major}.${minor}.${patch} $OPT_message"

sed -i '' "s/\(version\": *\"\)[^\"]*\(\"\)/\1${major}.${minor}.${patch}\2/g" package.json
commit
git tag "v${major}.${minor}.${patch}"
git push --tags
