# Feroze's dotfiles

## Install

git clone --recursive https://github.com/feroze/.dotfiles ~/.dotfiles

Then, go to /workflow to understand tools

## About

Repo used to setup machines, track dotfiles, and stay on top my shortcuts
tools - i3, vim, git, ROS

New computer:

- run setup script
- If using gnome, install gnome-tweak-tool and add caps as an additional esc

### Setup ###

install vim8 and i3-gaps, rofi, polybar

install ros
install git. change gitconfig.
make install script for ROS
change bashrc - put aliases shortcuts
install vim8.  fixup vimrc
maintain a set of files on github for dotfiles. keep it simple and useful.
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep 

vim-gtk

network – Don’t press available to all users
enable middle click

## TODO ##
Create a .vim/tmp file to store annoying swaps

Add vim shortcut/plugin for jump to definition in source

Add meld as default git diff tool
try out keynav

Add YCM binding for witching to Header files GoTo

map ctrl + " + y to y in vim

Ubuntu dfeault is ubuntu mono regular

Learn to use ctags with goto definitions & 
add a way of referencing cpp methods inside vim

add fonts

add i3-gaps ubuntu repo for latest version
Add preview tools to ranger and nautilus to view files directly without clicking

for polybar to work, install fonts and enable bitmap

# "Un-disable" bitmap fonts
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
# Clear the font cache
sudo fc-cache -f -v
