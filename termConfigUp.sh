echo"
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#Alias
alias wmi='whoami'
alias l='gls --color -lhF --group-directories-first'


# Alias accepting parametres: The alias gc build a funtion that execute the gcc
# command with some fixed parameters and one open used to add the name of the c
# file. 
alias gc='funtion compiler() { gcc -Wall -Werror -Wextra "$1" && ./a.out }; compiler'
#Alias norminette 42bcn
alias n='norminette -R CheckForbiddenSourceHeader'
#Alias Delete a DS_Store forlder. Could be use for other type of forlders
alias ds='find ~/ -type f -name ".DS_Store" -print -delete'

#Some more ls  aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls-CF'

#Alias Change Shell
alias chs='cat /etc/shells'
alias zs='sudo chsh -s /bin/zsh $USER'
alias bs='sudo chsh -s /bin/bash $USER'

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '- ('$branch')'
  fi
}

#PROMP
# export PS1='\[\033[01;32m\]\u@\h\[\033[1;34m\] $XDG_CURRENT_DESKTOP \[\033[0;31m\]\s \[\033[00m\]:\[\033[01;30m\]\w\[\033[1;31m\]$(git_branch_name)\[\033[00m\]\$-> '
PS1='\[\033[01;32m\]\u@\h\[\033[1;34m\] $XDG_CURRENT_DESKTOP \[\033[0;31m\]\s \[\033[00m\]:\[\033[01;30m\]\w\[\033[1;31m\]$(git_branch_name)\[\033[00m\]\$-> '
" >> /home/$USER/.bashrc