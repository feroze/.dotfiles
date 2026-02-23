# Extract any archive
extract () {
   if [ -f "$1" ] ; then
       case "$1" in
           *.tar.bz2)   tar xvjf "$1"    ;;
           *.tar.gz)    tar xvzf "$1"    ;;
           *.bz2)       bunzip2 "$1"     ;;
           *.rar)       unrar x "$1"       ;;
           *.gz)        gunzip "$1"      ;;
           *.tar)       tar xvf "$1"     ;;
           *.tbz2)      tar xvjf "$1"    ;;
           *.tgz)       tar xvzf "$1"    ;;
           *.zip)       unzip "$1"       ;;
           *.Z)         uncompress "$1"  ;;
           *.7z)        7z x "$1"        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

shopt -s histappend # append to history file instead of overwriting
shopt -s cmdhist # Combine multiline commands into one in history
HISTCONTROL=ignoredups:erasedups
export HISTIGNORE="ls:[bf]g:exit"
HISTFILESIZE=20000
HISTSIZE=100000

# customized prompter
GRAY='\[\033[1;30m\]'    # gray color
RESET='\[\033[0m\]'      # reset color
COLOR_G='\[\033[0;32m\]' # git status color
COLOR_W='\[\033[1;30m\]' # path color
type __git_ps1 &>/dev/null \
  && GIT_STATUS='$(__git_ps1 "(%s)")' \
  || GIT_STATUS=''
PROMPT_CHAR='λ'
PS1="${GRAY}┌ ${COLOR_W}\u@\h \w ${COLOR_G}${GIT_STATUS} ${GRAY} \n└> ${PROMPT_CHAR} ${RESET}"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# cd into directory of the fuzzy file find
jf() {
    local file
    local dir
    file=$(fzf +m -q "$1")\
        && dir=$(dirname "$file")
    [ -d "$dir" ] && pushd "$dir"
}

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

source ~/.dotfiles/system.aliases
