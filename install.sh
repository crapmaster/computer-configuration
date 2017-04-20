#!/bin/bash

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Replaces a configration file with a symbolic link to this
# directory if the file exists.

# @$1 : file including path in users home,
#       e.g.
#       $1=.bashrc       =>   ~/.bashrc
#       $1=app1/my.cfg   =>   ~/app1/my.cfg
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
replace_config () {
    if [ -z "$1" ]
    then
        echo "File name missing!"
        exit 1
    fi

    if [ -f "$PWD/$1" ]
    then
        if [ -f ~/$1 ]
        then
            rm ~/$1
        fi

        ln -s $PWD/$1 ~/$1
    fi
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Replace all config files with symlinks to this repository.

replace_config '.bash_aliases'
replace_config '.bashrc'
replace_config '.gitconfig'

