This repo is a testament to my laziness. May your keystrokes be few and
productivity plenty.

Repo used to setup machines, track dotfiles, and stay on top my shortcuts
tools - i3, vim, git, ROS


<!-- vim-markdown-toc GFM -->

* [Installation](#installation)
  * [dotfiles](#dotfiles)
* [vim](#vim)
  * [Essentials](#essentials)
  * [Shortcuts](#shortcuts)
  * [Shortcuts](#shortcuts-1)
  * [bash](#bash)
  * [Multiple computers](#multiple-computers)
  * [File system navigation](#file-system-navigation)
  * [Multimonitor](#multimonitor)
* [Proxy](#proxy)
* [latex](#latex)
* [window manager](#window-manager)
* ["Un-disable" bitmap fonts](#un-disable-bitmap-fonts)
* [Clear the font cache](#clear-the-font-cache)
* [TODO](#todo)

<!-- vim-markdown-toc -->

New computer:

- run setup script
- If using gnome, install gnome-tweak-tool and add caps as an additional esc

# Installation

```bash
git clone --recursive https://github.com/feroze/.dotfiles ~/.dotfiles
```

install git, add following to ~/.gitconfig:

```INI
[include]
  path = ~/.dotfiles/.gitconfig
```

## dotfiles

install gnu stow
sudo apt install stow

Then
cd .dotfiles
stow vim
stow i3

For .bashrc customizations,
add following lines to the existing .bashrc:
source ~/.dotfiles/git.bashrc
source ~/.dotfiles/system.bashrc

# vim

Install vim8 from PPA
Read through .vimrc to understand shortcuts and settings

Install vim-gtk-py2 and do sudo update-alternatives --set vim
This is needed to use vim-ros plugin and has +python2

Inspiration : https://statico.github.io/vim3.html

## Essentials
- File opening: fzf
- File string searching: Ack + ag
- Usability: Airline status bar
- Smart code editing: YCM, ALE syntax checker
- Internals: Plug plugin manager
- Git integration: Fugitive and git gutter

## Shortcuts

use Ctrl-t to come back to original.
Ctrl-O
CTRL-T is working with tags stack

CTRL-O is working with jumplist

use :A to switch to C/CPP header files

Use :Ex to explore file system

## Shortcuts ##
cd $(fn *str*) will go to first occurence

## bash

Lots of shortcuts and aliases are there
Split into two files:
mi - colormake install
cm - catkin_make at catkin_ws directory

pushd & popd for navigation

## Multiple computers

Use synergy.

## File system navigation

Use nautilus + ranger

nautilus for usual navigation + editing.

ranger for zooming across files. Not super comfortable with
deleting files and cut/copy/pasting with ranger

## Multimonitor

Instead of using xrandr to set the monitor position and orientation everytime,

Use the gnome display to generate the monitors.xml

Then

sudo cp ~/.config/monitors.xml /var/lib/lightdm/.config/

You can try softlinking it after fixing permissions if you want

# Proxy
If there is a work proxy, you need to configure

.gitconfig
.curlrc
firefox
chrome
ssh?

# latex
Use vimtex with latexmk which autobuilds the files on save

# window manager
Install i3-gaps, rofi, polybar

add fonts

add i3-gaps ubuntu repo for latest version
Add preview tools to ranger and nautilus to view files directly without clicking

for polybar to work, install fonts and enable bitmap

# "Un-disable" bitmap fonts
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf

# Clear the font cache
sudo fc-cache -f -v

# TODO
- Use fzf + fasd to improve file navigation
  http://seanbowman.me/blog/fzf-fasd-and-bash-aliases/ and
  https://github.com/junegunn/fzf/wiki/examples#changing-directory

Add vim shortcut/plugin for jump to definition in source

try out keynav - navigate window gui using just keyboard

Add YCM binding for witching to Header files GoTo

map ctrl + " + y to y in vim

Ubuntu dfeault is ubuntu mono regular

Learn to use ctags with goto definitions & 
add a way of referencing cpp methods inside vim

network – Don’t press available to all users
enable middle click

