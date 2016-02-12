source ~/.git-prompt.sh

alias attu='ssh hschafer@attu.cs.washington.edu'
alias ll='ls -aG'
alias emcs='emacs'
alias emac='emacs'

# The next lines set up some aliases 
alias ls='ls -G'
alias l='ls'
alias grep='grep --color'
alias emcs='emacs'
alias emac='emacs'
alias octave='/usr/local/octave/3.8.0/bin/./octave'
alias uw='cd ~/Documents/UW'
alias ta='cd ~/Documents/UW/TA'
alias projects='cd Documents/UW/332/Projects/'
alias even='echo I cant'
alias sublime='/Applications/Sublime\ Text\ 2.app/Contents/MacOS/Sublime\ Text\ 2 &'
alias sub='sublime'
alias sql='sqlite3'
alias haskell='ghci'
alias hskl='ghci'
#alias python='python3.4'
# added by Anaconda 2.1.0 installer
export PATH="//anaconda/bin:$PATH"
# added sox
export PATH="~/Downloads/sox-14.4.1/:$PATH"
# added tex commands
export PATH="/usr/local/texlive/2014/bin:$PATH"
# add libsvm
export PATH="/Library/libsvm-3.20:$PATH"
# add scala
export SCALA_HOME="/usr/local/share/scala-2.11.6"
export PATH="$PATH:$SCALA_HOME/bin"
# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
PATH="${PATH}:~/bin"
export PATH

# Add GHC 7.8.4 to the PATH, via http://ghcformacosx.github.io/
export GHC_DOT_APP="/Library/ghc-7.8.4.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi
#export PS1=$(seq -f '_' -s '' $(tput cols))"\n| \[\e[1;37m\]\u@\h : \w\[\e[0m\]\$(__git_ps1)\n| => "
#export PS2="| => "

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
    PS1=$(seq -f '_' -s '' $(tput cols))"\n| "
    
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
        PS1+="$White\\u@\\h "
    fi
    # Print the working directory and prompt marker in blue, and reset
    # the text color to the default.
    PS1+=": \w$Reset " 
    
    # Add git prompt
    PS1+=$(__git_ps1)

    # Add ending prompt
    PS1+="\n| => "
    PS2="| => "

}
PROMPT_COMMAND='set_prompt'
alias cd='cd -P'
alias a='attu'
alias mount='cd; mkdir attu; sshfs hschafer@attu.cs.washington.edu: ~/attu; cd ~/attu'
alias unmount='cd; umount attu; rm -r ~/attu'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi


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

# Syntax highlighting cat
alias ccat='pygmentize -g'

# Some stolen stuff from https://gist.github.com/natelandau/10654137
export BLOCKSIZE=1k
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
function cd() { builtin cd "$@" && ls; }
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .2='cd ../..'                         # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'
alias f='open -a Finder ./'
mcd () { mkdir -p "$1" && cd "$1"; }
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
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
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

alias vim='mvim'
alias v='vim'

if [ -z $TMUX ]; then
    tmux
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
