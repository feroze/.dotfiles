# better file building
alias mi="colormake install; notify-send 'Make finished!'"
alias mi4="colormake install -j4; notify-send 'Make finished!'"
alias m="colormake; notify-send 'Make finished!'"
alias m4="colormake -j4; notify-send 'Make finished!'"
alias m13="colormake -j13; notify-send 'Make finished!'"
alias mc="make clean"

alias fn="find -name"

# get rid of command not found
alias cd..='cd ..'

# a quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

## correct tmux colors for 256
alias tmux='tmux -2'

# useful shortcuts
alias r='ranger'
alias p='ps ax | grep -v grep | grep -i'
alias quit='exit'
alias q='exit'

# Manage source files
alias b='vim ~/.bashrc'
alias sb='source ~/.bashrc'
alias vimrc='vim ~/.vimrc'

# Make caps and extra esc
alias caps='setxkbmap -option caps:escape'

# Alias for personal logs
alias devlog="~/.dotfiles/scripts/log.bash devlog"
alias journal="~/.dotfiles/scripts/log.bash journal"

# Aliases for xclip
alias "c=xclip"
alias "v=xclip -o"

# Extract any archive
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend # append to history file instead of overwriting
shopt -s cmdhist # Combine multiline commands into one in history
# Ignore duplicates, ls without options and builtin commands
#HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit" # Ignore ls and exit

eval $(thefuck --alias)

# customized prompter (add these to your ~/.bash_profile or ~/.bashrc)
GRAY='\[\033[1;30m\]'    # gray color
RESET='\[\033[0m\]'      # reset color
COLOR_U='\[\033[1;31m\]' # username color
COLOR_H='\[\033[0;35m\]' # hostname color
COLOR_G='\[\033[0;32m\]' # git status color
COLOR_W='\[\033[1;30m\]' # path color
GIT_STATUS='$(__git_ps1 "(%s)")' # this gets the status of the current repo
#PROMPT_CHAR='\$' # your desired prompt character
PROMPT_CHAR='\$' # your desired prompt character
PROMPT_CHAR='λ' # your desired prompt character
PS1="${GRAY}┌ ${COLOR_W}\w ${COLOR_G}${GIT_STATUS} ${GRAY} \n└> ${PROMPT_CHAR} ${RESET}"

# fasd + fzf

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(fasd --init auto)"

# Use j instead of cd
j() {
    local dir="$(fasd -ld "$@")"
    [[ -d "$dir" ]] && pushd "$dir"
}
complete -d j

# jj helps you jump into 'frequecely' used files
jj() {
    local dir
    dir=$(fasd -Rdl |\
        sed "s:$HOME:~:" |\
        fzf --no-sort +m -q "$*" |\
        sed "s:~:$HOME:")\
    && pushd "$dir"
}
complete -d jj

# fuzzy file find
jd() {
    local dir
    dir=$(find ${1:-*} -path '*/\.*'\
        -prune -o -type d\
        -print 2> /dev/null | fzf +m)
    [ -d "$dir" ] && pushd "$dir"
}
complete -d jd

# cd into directory of the fuzzy file find
jf() {
    local file
    local dir
    file=$(fzf +m -q "$1")\
        && dir=$(dirname "$file")
    [ -d "$dir" ] && pushd "$dir"
}
complete -f jf

# find files
function ff () { find . -name "$@" ; }

# ROS shortcuts

alias cb='catkin build -sc'
alias cbn='catkin build --no-deps'
alias cc='catkin clean -y'
cbt() {
    catkin build "$1" --catkin-make-args run_tests
}
alias w='~/bin/select_workspace.py && sb'

bag_time() {
  for f in *.bag
  do
    echo -n $f " "
    rosbag info $f -yk duration
  done
}


# git aliases

alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gf='git commit --fixup HEAD  && git rebase -i --autosquash HEAD~2'
alias gfa='git commit -a --fixup HEAD  && git rebase -i --autosquash HEAD~2'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '

alias rebase_with_master='git checkout master && git pull && git checkout - && git rebase master'

alias rosrung="rosrun --prefix 'gdb -ex run --args'"

# make + cd build 
function mcd() { [ -n "$1" ] && mkdir -p "$@" && cd "$1"; }

# for taskwarrior
alias t='task'

# swap cp for rsync w/ progress bar
alias cp='rsync --archive --progress --partial --human-readable'
