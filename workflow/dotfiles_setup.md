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
