alias mi="colormake install"
alias mi4="colormake install -j4"
alias m="colormake"
alias m4="colormake -j4"
alias m13="colormake -j13"
alias mc="make clean"

alias cm="cd ~/catkin_ws/; catkin_make; cd -"
alias cb="cd ~/catkin_ws/; catkin build; cd -"
alias cc="cd ~/catkin_ws/; catkin clean -y; cd -"

alias fn="find -name"

## get rid of command not found ##
alias cd..='cd ..'
 
## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

## correct tmux colors for 256
alias tmux='tmux -2'

alias quit='exit'

# Manage source files
alias bashrc='vim ~/.bashrc'
alias sourcebashrc='source ~/.bashrc'

alias vimrc='vim ~/.vimrc'

# Make caps and extra esc
alias caps='setxkbmap -option caps:escape'


# Alias for personal logs
alias devlog="~/.dotfiles/scripts/log.bash devlog"
alias worklog="~/.dotfiles/scripts/log.bash worklog"
alias journal="~/.dotfiles/scripts/log.bash journal"
alias rapidlearner="~/.dotfiles/scripts/log.bash rapidlearner"

# Aliases for xclip
alias "c=xclip"
alias "v=xclip -o"
