# Utils commands for developer

This is a project hold on some useful shell/python scripts for developer

## Install

```bash
git clone https://github.com/acrazing/scripts.git

sh ./scripts/install.sh
```

## Commands List

```bash
Commands:
funcs.sh: util functions
git_diff_files.sh: Get changed and exists files for git
git_push.sh: commit changes to work tree and push it to 'origin' remote and change version for package.json
help.sh: Get all installed commands on your machine
install.sh: Install scripts to your machine
new_command.sh: Create a script file under the installed directory as a global command, and open it by vim
new_empty.sh: Create empty files and add to vcs
new_file.sh: Create c style files
new_py.sh: Create python3 style files
new_script.sh: create a shell style file and add execute permission
readme.sh: [Internal] generate readme for the project
try_add_file.sh: Automaticly add file to vcs for svn/git
ts_trim_sc.sh: Remove the end semicolons for import statement in '.ts(x?)' files
```

## Commands


### funcs.sh

util functions

```bash
funcs.sh:
    util functions

Usage:
    util functions for other shell commands
```

### git_diff_files.sh

Get changed and exists files for git

```bash
git_diff_files.sh:
    Get changed and exists files for git

Usage:
    git_diff_files.sh [filter]
    If filter is set, will use this to filter file list
    The filter format is regex
```

### git_push.sh

commit changes to work tree and push it to 'origin' remote and change version for package.json

```bash
git_push.sh:
    commit changes to work tree and push it to 'origin' remote and change version for package.json

Usage:
    git_push.sh [version=none] <message>
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
```

### help.sh

Get all installed commands on your machine

```bash
help.sh:
    Get all installed commands on your machine

Usage:
    help.sh
```

### install.sh

Install scripts to your machine

```bash
install.sh:
    Install scripts to your machine

Usage:
    install.sh
```

### new_command.sh

Create a script file under the installed directory as a global command, and open it by vim

```bash
new_command.sh:
    Create a script file under the installed directory as a global command, and open it by vim

Usage:
    new_command.sh <script name> [env=bash]
```

### new_empty.sh

Create empty files and add to vcs

```bash
new_empty.sh:
    Create empty files and add to vcs

Usage:
    new_empty.sh <...files>
```

### new_file.sh

Create c style files

```bash
new_file.sh:
    Create c style files

Usage:
    new_file.sh <...filename>
    For example:
        new_file.sh src/index.tsx src/index.c src/index.cc
        will create three files under src directory, and add c style file
        comment to the file, and try to add it to vcs(git/svn)
        if the filename endswith .tsx, will auto add import react line
```

### new_py.sh

Create python3 style files

```bash
new_py.sh:
    Create python3 style files

Usage:
    new_py.sh <...files>
```

### new_script.sh

create a shell style file and add execute permission

```bash
new_script.sh:
    create a shell style file and add execute permission

Usage:
    new_script.sh <script name> [env=bash]
    For example:
        `new_script.sh hello/world.sh`
        will create a file `world.sh` under ./hello directory
        with shebang and some useful comments
```

### readme.sh

[Internal] generate readme for the project

```bash
readme.sh:
    [Internal] generate readme for the project

Usage:
    readme.sh
```

### try_add_file.sh

Automaticly add file to vcs for svn/git

```bash
try_add_file.sh:
    Automaticly add file to vcs for svn/git

Usage:
    try_add_file.sh <...files>
```

### ts_trim_sc.sh

Remove the end semicolons for import statement in '.ts(x?)' files

```bash
ts_trim_sc.sh:
    Remove the end semicolons for import statement in '.ts(x?)' files

Usage:
    ts_trim_sc.sh [all]
    If not set param all, will only check files that changed,
    or will check all files
```

## License

[MIT](./LICENSE)


