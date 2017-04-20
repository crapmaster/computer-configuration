#!/bin/bash

# Replaces all config files with symlinks
# to this repository.

rm ~/.bash_aliases
rm ~/.bashrc

ln -s $PWD/.bash_aliases ~/.bash_aliases
ln -s $PWD/.bashrc       ~/.bashrc

