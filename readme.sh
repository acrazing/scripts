#!/usr/bin/env bash
#
# readme.sh
# @author acrazing
# @since 2016-11-26 20:42:52
# @desc
#

cd `dirname $0`
. ./funcs.sh

__intro__="[Internal] generate readme for the project"
__help__=`basename $0`

args "$@"

file=README.md

echo "# Utils commands for developer

## Install

\`\`\`bash
git clone https://github.com/acrazing/scripts.git

sh ./scripts/install.sh
\`\`\`

## Commands

" > $file

cmds="$(find . -type f | grep -v '/\.')"

for cmd in $cmds
do
    if [ -x $cmd ]; then
        echo "### $(basename $cmd)

$($cmd -i)

\`\`\`bash
$($cmd -h)
\`\`\`
" >> $file
    fi
done

echo "## License

[MIT](./LICENSE)

" >> $file


