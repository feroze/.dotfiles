#!/bin/bash

# This was written for ubuntu 16.04

read -p 'update repo? (Y/n) ' -n 1 confirmation                                                                                     
if [[ $confirmation != 'n' && $confirmation != 'N' ]]; then
sudo apt-get update
fi

###
echo " "

read -p 'Install chrome? (Y/n) ' -n 1 confirmation                                                                                     
if [[ $confirmation != 'n' && $confirmation != 'N' ]]; then

	wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
# write script to delete if google-chrome.list already exists
	sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
	sudo apt-get update
	sudo apt-get install -y google-chrome-stable           
fi

###
echo " "

read -p 'Upgrade computer? (Y/n) ' -n 1 confirmation                                                                                     
if [[ $confirmation != 'n' && $confirmation != 'N' ]]; then
	sudo apt-get update
	sudo apt-get upgrade
fi

###
echo " "

read -p 'Install dev softwares? (Y/n) ' -n 1 confirmation                                                                                     
if [[ $confirmation != 'n' && $confirmation != 'N' ]]; then
	sudo apt-get install -y git tmux ipython python-pip curl vim-gnome gdb colormake build-essential cmake python-dev exuberant-ctags xsel
fi

###
echo " "

read -p 'Install system tools+media softwares? (Y/n) ' -n 1 confirmation                                                                                     
if [[ $confirmation != 'n' && $confirmation != 'N' ]]; then
	sudo apt-get install -y dconf-tools powertop htop vlc shutter gimp
fi

###
echo " "

read -p 'Install Java 8? (Y/n) ' -n 1 confirmation                                                                                     
if [[ $confirmation != 'n' && $confirmation != 'N' ]]; then
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer
sudo apt-get install oracle-java8-set-default
fi

###
#echo " "

#read -p 'Install ack and rename? (Y/n) ' -n 1 confirmation                                                                                     
#if [[ $confirmation != 'n' && $confirmation != 'N' ]]; then
	#sudo apt-get install -y ack-grep
	#sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep
#fi

###
echo " "

read -p 'Install Ag Silversearcher? (Y/n) ' -n 1 confirmation                                                                                     
if [[ $confirmation != 'n' && $confirmation != 'N' ]]; then
	sudo apt-get install -y silversearcher-ag
fi


###
echo " "

read -p 'Create soft-links for .vim, .vimrc? (Y/n) ' -n 1 confirmation                                                                                     
if [[ $confirmation != 'n' && $confirmation != 'N' ]]; then
  ln -s ~/.dotfiles/.vim ~/.vim
  ln -s ~/.dotfiles/.vimrc ~/.vimrc
fi

###
echo " "

read -p 'Link system.bashrc and git.bashrc to ~/.bashrc? (Y/n) ' -n 1 confirmation                                                                                     
if [[ $confirmation != 'n' && $confirmation != 'N' ]]; then
  echo "source ~/.dotfiles/system.bashrc" >> ~/.bashrc
  echo "source ~/.dotfiles/git.bashrc" >> ~/.bashrc
fi

###
echo " "

read -p 'install all vundle plugins? (Y/n) ' -n 1 confirmation                                                                                     
if [[ $confirmation != 'n' && $confirmation != 'N' ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
fi

###
echo " "

read -p 'setup git scripts ' -n 1 confirmation                                                                                     
if [[ $confirmation != 'n' && $confirmation != 'N' ]]; then
  echo "GIT_SCRIPTS="$HOME/.dotfiles/git_scripts"" >> ~/.bashrc
  #echo "PATH="$PATH:$GIT_SCRIPTS"" >> ~/.bashrc
fi


#TODO install autolock
