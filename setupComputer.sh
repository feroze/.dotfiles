#!/bin/bash
set -e

# This was written for Ubuntu 22.04

read -p 'Update repos? (Y/n) ' -n 1 confirmation
echo
if [[ $confirmation != 'n' && $confirmation != 'N' ]]; then
	sudo apt update
fi

###
echo " "

read -p 'Upgrade computer? (Y/n) ' -n 1 confirmation
echo
if [[ $confirmation != 'n' && $confirmation != 'N' ]]; then
	sudo apt update
	sudo apt upgrade
fi

###
echo " "

read -p 'Install dev tools? (Y/n) ' -n 1 confirmation
echo
if [[ $confirmation != 'n' && $confirmation != 'N' ]]; then
	sudo apt install -y git tmux curl vim-gtk3 gdb colormake build-essential cmake python3-dev python3-pip universal-ctags xsel sshfs stow
fi

###
echo " "

read -p 'Install system tools? (Y/n) ' -n 1 confirmation
echo
if [[ $confirmation != 'n' && $confirmation != 'N' ]]; then
	sudo apt install -y htop ranger btop silversearcher-ag
	pip3 install nvitop
fi

###
echo " "

read -p 'Link system.bashrc to ~/.bashrc? (Y/n) ' -n 1 confirmation
echo
if [[ $confirmation != 'n' && $confirmation != 'N' ]]; then
	grep -qxF 'source ~/.dotfiles/system.bashrc' ~/.bashrc || echo 'source ~/.dotfiles/system.bashrc' >> ~/.bashrc
fi

###
echo " "

read -p 'Setup git (scripts + global gitconfig include)? (Y/n) ' -n 1 confirmation
echo
if [[ $confirmation != 'n' && $confirmation != 'N' ]]; then
	grep -qxF 'GIT_SCRIPTS="$HOME/.dotfiles/git_scripts"' ~/.bashrc || echo 'GIT_SCRIPTS="$HOME/.dotfiles/git_scripts"' >> ~/.bashrc
	git config --global include.path ~/.dotfiles/.gitconfig
fi

###
echo " "

read -p 'Stow dotfile symlinks (vim, tmux, gdb, vscode)? (Y/n) ' -n 1 confirmation
echo
if [[ $confirmation != 'n' && $confirmation != 'N' ]]; then
	cd ~/.dotfiles
	stow vim
	stow tmux
	stow gdb
	stow vscode
fi
