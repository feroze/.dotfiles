This repo is a testament to my laziness. May your keystrokes be few and
productivity plenty.

Repo used to setup machines, track dotfiles, and stay on top my shortcuts
tools - i3, vim, git, ROS


<!-- vim-markdown-toc GFM -->

* [Setup](#setup)
* [vim](#vim)
  * [Essentials](#essentials)
  * [Shortcuts](#shortcuts)
* [bash](#bash)
* [ROS](#ros)
* [Misc notes](#misc-notes)
* [TODO](#todo)

<!-- vim-markdown-toc -->


# Setup

- Clone dotfiles and setup essential software

```
git clone --recursive https://github.com/feroze/.dotfiles ~/.dotfiles`
~/.dotfiles/setupComputer.sh
```

- Install git, add following to ~/.gitconfig:

```
[include]
  path = ~/.dotfiles/.gitconfig
```

```
install gnu stow
sudo apt install stow
cd .dotfiles
stow vim
stow i3
```

- For .bashrc customizations, add following lines to the existing .bashrc:
```
source ~/.dotfiles/git.bashrc
source ~/.dotfiles/system.bashrc
```
- If using gnome, install gnome-tweak-tool and add caps as an additional esc

# vim

- Add vim8 PPA. Install vim-gtk-py2 for +python2 support
- Set correct vim using `sudo update-alternatives --set vim`
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
- window manager: i3-gaps + rofi + polybar
- keyboard controlled mouse: keynav
- Multimonitor: Use the gnome display to generate the monitors.xml and copy
  config to lightdm sudo cp ~/.config/monitors.xml /var/lib/lightdm/.config/
- Enable bitmap fonts for polybar `sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf`
- Clear the font cache `sudo fc-cache -f -v`
- Proxy files configs: .gitconfig, .curlrc, firefox, chrome, ssh?

# TODO
- Use fzf + fasd to improve file navigation
  http://seanbowman.me/blog/fzf-fasd-and-bash-aliases/ and
  https://github.com/junegunn/fzf/wiki/examples#changing-directory
- Add vim shortcut/plugin for jump to definition in source
- Add YCM binding for witching to Header files GoTo
- Roll all setup into setupComputer.sh - worth the time?
- Add bro pages to list
