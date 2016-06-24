Note: Repo used to setup machines, track dotfiles, and stay on top my shortcuts
tools - tmix, cpp, git, py, ROS

TODO:
Setup shell script to auto copy links and backup old ones
fix stupid colors
swap fn and ctrl in t420
write script to link .bashrc stuff from home to .dotfiles directory
also write a script to swap profiles easily

--
New computer:

run setup script
install gnome-tweak-tool and add caps as an additional esc

## bash ##
Lots of shortcuts and aliases are there
Split into two files:
mi - colormake install
cm - catkin_make at catkin_ws directory

tmux is configured to force 256 colors

## vim ##

Plugins being used:
* Vundle
* NERDCommenter
* YouCompleteMe
* Ctrl-P

### Setup ###

manually git clone Vundle. Then, open vim and :PluginInstall
Compile YCM and add ycm_config_file

Read through .vimrc to understand shortcuts and settings

Create a .vim/tmp file to store annoying swaps

use :A to switch to C/CPP header files

### NERDTree ###

### Ctrl-P ###
https://github.com/kien/ctrlp.vim

Fuzzy search.
Default mapped to ctrl-p

### NERDCommenter ###
use ,c to toggle comment a line

### Typical vim usage ###
// add links

Use :Ex to explore file system

### code folding ###
Then you can toggle folding with za. You can fold everything with zM and unfold everything with zR. zm and zr can be used to get those folds just right

## Shortcuts ##
cd $(fn *str*) will go to first occurence

## other new computer stuff ##

install tmux. start it at every bash start
install ros
install git. change gitconfig.
make install script for ROS
change bashrc - put aliases shortcuts
install vim.  fixup vimrc
maintain a set of files on github for dotfiles. keep it simple and useful.
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep 

vim-gtk

network – Don’t press available to all users
enable middle click

# TODO #
Add commands to close vim buffer without closing split

Add vim shortcut/plugin for jump to definition in source
