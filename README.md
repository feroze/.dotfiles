This repo is a testament to my laziness. May your keystrokes be few and
productivity plenty.

Repo used to setup machines, track dotfiles, and stay on top my shortcuts
tools - i3, vim, git, ROS


<!-- vim-markdown-toc GFM -->

* [Installation](#installation)
  * [dotfiles](#dotfiles)
* [vim](#vim)
  * [Essentials](#essentials)
  * [Useful shortcuts](#useful-shortcuts)
* [bash](#bash)
* [ROS](#ros)
  * [Useful shortcuts](#useful-shortcuts-1)
* [Misc notes](#misc-notes)
* [Proxy](#proxy)
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

```
install gnu stow
sudo apt install stow
cd .dotfiles
stow vim
stow i3
```

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
- Git integration: Fugitive and git gutter

## Useful shortcuts

- Ctrl-t to come back to original.
- CTRL-T is working with tags stack
- CTRL-O is working with jumplist
- :A to switch to C/CPP header files
- :Ex to explore file system

# bash

Lots of shortcuts and aliases are there
Split into two files:
mi - colormake install
cm - catkin_make at catkin_ws directory

pushd & popd for navigation

- File system navigation: nautilus + ranger

# ROS

## Useful shortcuts
- roscd
- clean workspace: cc
- build workspace: cb
- build test: cbt <package_name>

# Misc notes
- Multiple computers mouse + keyboard sharing: synergy
- latex: vimtex + latexmk for autobuilding on save
- window manager: i3-gaps + rofi + polybar
- keyboard controlled mouse: keynav
- Multimonitor: Use the gnome display to generate the monitors.xml and copy
  config to lightdm sudo cp ~/.config/monitors.xml /var/lib/lightdm/.config/

# Proxy
You need to configure
- .gitconfig
- .curlrc
- firefox
- chrome
- ssh?

# "Un-disable" bitmap fonts
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf

# Clear the font cache
sudo fc-cache -f -v

# TODO
- Use fzf + fasd to improve file navigation
  http://seanbowman.me/blog/fzf-fasd-and-bash-aliases/ and
  https://github.com/junegunn/fzf/wiki/examples#changing-directory

- Add vim shortcut/plugin for jump to definition in source
- Add YCM binding for witching to Header files GoTo
