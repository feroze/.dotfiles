# Feroze's dotfiles

## Install

```bash
git clone --recursive https://github.com/feroze/.dotfiles ~/.dotfiles
```

Then, go to /workflow to understand tools

## About

Repo used to setup machines, track dotfiles, and stay on top my shortcuts
tools - i3, vim, git, ROS

New computer:

- run setup script
- If using gnome, install gnome-tweak-tool and add caps as an additional esc

### Setup ###

read workflow/vim/setup.md
read workflow/window_manager.md

install ros
install git, add following to ~/.gitconfig:

```INI
[include]
  path = ~/.dotfiles/.gitconfig
```


## TODO ##
Add vim shortcut/plugin for jump to definition in source

try out keynav - navigate window gui using just keyboard

Add YCM binding for witching to Header files GoTo

map ctrl + " + y to y in vim

Ubuntu dfeault is ubuntu mono regular

Learn to use ctags with goto definitions & 
add a way of referencing cpp methods inside vim

network – Don’t press available to all users
enable middle click
