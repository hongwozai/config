#!/bin/bash

EDITOR=vi
# EDITOR=emacsclient -nw -a "" -c

function find_project_file() {
    if [ -f $1/"Makefile" -o -f $1/"makefile" -o -f $1/"CMakeLists.txt" \
            -o -d $1/".git" -o -d $1/".svn" ];then
        return 1;
    fi
    return 0;
}

function open_project_file() {
    if [ $EDITOR == "vi" -a -f "/usr/bin/vim" ]; then
        EDITOR=vim
    fi
    $EDITOR `find $1 \( -path '*/.*/*' -o -path '*/build/*' \) -prune -o -type f -print | xargs ls -tB | tr ' ' '\n' | percol`
}

function find_project() {
    local dir=`pwd`
    while [ $dir != "/" ]; do
        # 找到工程
        # echo $dir
        find_project_file $dir
        if [ $? -eq 1 ]; then
            open_project_file $dir
            return
        fi
        dir=`dirname $dir`
    done
    # 最后一级目录不再判定
    echo "找不到工程"
}

alias vip='find_project'
alias emp="EDITOR='emacsclient -nw -a "" -c' find_project"