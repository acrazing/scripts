#!/usr/bin/env bash
#
# git_push.sh
# @author acrazing
# @since 2016-11-29 14:38:30
# @desc git_push.sh
#
__intro__="commit changes to work tree and push it to 'origin' remote and change version for package.json"
__help__="`basename $0` [version=none] <message>
    versions:
        none: do nothing
        patch: 1.1.1 => 1.1.2
        minor: 1.1.1 => 1.2.0
        major: 1.1.1 => 2.0.0
    If the first input param is not one of the upon enum, will
    treat as message, and version will be default value

    If the branch is new, will set upstream to origin/branch

    If no branch, will set as master
    
    If version is not none, will update version, and add
    version tag, and push it to remote
"

. "`dirname $0`/funcs.sh"

set -xe

level=${1}
msg=${2}

commit() {
    branch=$(git branch | grep -E '^\* *' | sed -E 's/^\* *//')
    branch=${branch:-master}
    has=$(git branch -r | grep -E "origin/${branch}$" | wc -l)
    git add .
    git commit -m "${msg}"
    git fetch origin
    if [ $has -eq 0 ]; then
        git push -u origin $branch
    else
        git rebase origin/$branch
        git push origin $branch
    fi
    exit 0
}

if [ "$(git st -s)" == "" ]; then
    exit 0
fi

if [ $# -eq 0 ]; then
    help "Please input commit message"
fi

if [ $# -lt 2 ]; then
    level=none
    msg=${1}
fi

if [ ! -f package.json ]; then
    commit
fi

major=$(awk -F '"' '/version/{print $4}' package.json | awk -F '.' '{print $1}')
minor=$(awk -F '"' '/version/{print $4}' package.json | awk -F '.' '{print $2}')
patch=$(awk -F '"' '/version/{print $4}' package.json | awk -F '.' '{print $3}')

case ${level} in
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
        echo $patch
        ((patch++))
        ;;
    *)
        commit
        ;;
esac

msg="v${major}.${minor}.${patch} ${msg}"

sed -i '' "s/\(version\": *\"\)[^\"]*\(\"\)/\1${major}.${minor}.${patch}\2/g" package.json
commit
git tag "v${major}.${minor}.${patch}"
git push --tags

