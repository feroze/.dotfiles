This repo is a testament to my laziness. May your keystrokes be few and
productivity plenty.

Repo used to setup machines, track dotfiles, and stay on top my shortcuts
tools - i3, vim, git, ROS


<!-- vim-markdown-toc GFM -->

- [Setup](#setup)
- [vim](#vim)
  - [Essentials](#essentials)
  - [Shortcuts](#shortcuts)
- [bash](#bash)
- [ROS](#ros)
- [Misc notes](#misc-notes)

<!-- vim-markdown-toc -->


# Setup

- Clone dotfiles and run setup script (installs packages and stows symlinks):

```
git clone --recursive https://github.com/feroze/.dotfiles ~/.dotfiles
~/.dotfiles/setupComputer.sh
```



# vim

- Read through .vimrc to understand keyboard commands and settings
- Inspiration: https://statico.github.io/vim3.html

## Essentials
- File opening: fzf
- File string searching: Ack + ag
- Usability: Airline status bar
- Smart code editing: YCM, ALE syntax checker
- Git integration: Fugitive and git gutter

## Shortcuts

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

- roscd
- cc: clean workspace
- cb: build workspace
- cbt <package> build test for package name
- rosed <package> <file>: directly edit file in package

# Misc notes
- Multiple computers mouse + keyboard sharing: synergy
- latex: vimtex + latexmk for autobuilding on save
- Enable bitmap fonts for polybar `sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf`
- Clear the font cache `sudo fc-cache -f -v`
- Proxy files configs: .gitconfig, .curlrc, firefox, chrome, ssh?
