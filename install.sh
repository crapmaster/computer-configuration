#!/bin/bash

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Replaces a configuration item with a symbolic link to this
# directory if the item exists.

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

    if [ -d "$PWD/$1" ]
    then
        if [ -d ~/$1 ]
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
replace_config '.gitmessage.txt'

# Force GNOME Terminal to open maximized by default
gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar true
gsettings set org.gnome.Terminal.Legacy.WindowScale window-state 'maximized' 2>/dev/null || true

# Define a custom keybinding slot
gsettings set org.cinnamon.desktop.keybindings custom-list "['custom0']"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom0/ name "Maximized Terminal"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom0/ command "gnome-terminal --maximized"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom0/ binding "['<Primary><Alt>t']"

# Copy Spotify start script
cp -p start_spotify.sh ~/

