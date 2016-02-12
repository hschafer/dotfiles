# Source global defs
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

## Making built in commands better
alias ls='ls -G'
alias l='ls'
alias ll='ls -a'
alias grep='grep --color'
alias cd='cd -P'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
function cd() { builtin cd "$@" && ls; }
# Colorful man pages
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		    man "$@"
}

## Moving on around
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .2='cd ../..'                         # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'

## Really helpful aliases 
alias attu='ssh hschafer@attu.cs.washington.edu'
alias a='attu'
alias sql='sqlite3'
alias mount='cd; mkdir attu; sshfs hschafer@attu.cs.washington.edu: ~/attu; cd ~/attu'
alias unmount='cd; umount attu; rm -r ~/attu'
alias vim='mvim'
alias v='vim'
alias vims='vim -S .session'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias ccat='pygmentize -g'
mcd () { mkdir -p "$1" && cd "$1"; }

## System depended commands
alias clint="~/Documents/333/clint.py $1"
alias cpplint="~/Documents/333/cpplint.py $1"
alias compile="python ~/bin/compile.py $1"

## Prompt stuff

source ~/.git-prompt.sh

set_prompt () {
    Last_Command=$? # Must come first!
    Blue='\[\e[01;34m\]'
    White='\[\e[01;37m\]'
    Red='\[\e[01;31m\]'
    Green='\[\e[01;32m\]'
    Reset='\[\e[00m\]'
    FancyX='\342\234\227'
    Checkmark='\342\234\223'

    GIT_PS1_SHOWUNTRACKEDFILES="True"
    GIT_PS1_SHOWDIRTYSTATE="True"


    # Set line of dashes
    PS1="$HORIZONTAL_LINE\n| "

    # If it was successful, print a green check mark. Otherwise, print
    # a red X.
    if [[ $Last_Command == 0 ]]; then
        PS1+="$Green$Checkmark "
    else
        PS1+="$Red$FancyX "
    fi

    # If root, just print the host in red. Otherwise, print the current user
    # and host in green.
    if [[ $EUID == 0 ]]; then
        PS1+="$Red\\h "
    else
        PS1+="$Green\\u@\\h "
    fi
    # Print the working directory and prompt marker in blue, and reset
    # the text color to the default.
    PS1+=": $Reset\\w" 
    
    # Add git prompt
    PS1+=$(__git_ps1)

    # Add ending prompt
    PS1+="\n| => "
    PS2="| => "

}
PROMPT_COMMAND='set_prompt'

## Some stolen stuff from https://gist.github.com/natelandau/10654137
export BLOCKSIZE=1k
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}


## Some startup stuff
if [ -z $TMUX ]; then
    tmux
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

