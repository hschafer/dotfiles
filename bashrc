XDG_CONFIG_HOME=~/.config
# Source global defs
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f ~/.profile ]; then
    source ~/.profile
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
alias vims='vim -S .session'
USE_MACVIM=false
function vim() {
   if [ $USE_MACVIM = "true" ]
   then
      mvim $@
   else
      nvim $@
   fi
}
alias v='vim'
function macvim() {
   if [ $USE_MACVIM = "true" ]
   then
      USE_MACVIM="false"
   else 
      USE_MACVIM="true"
   fi
   echo "USE_MACVIM is now $USE_MACVIM"
}
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias ccat='pygmentize -g'
mcd () { mkdir -p "$1" && cd "$1"; }

## Some system dependent aliases
alias f='open -a Finder ./'
alias octave='/usr/local/octave/3.8.0/bin/./octave'
alias uw='cd ~/Documents/UW'
alias ta='cd ~/Documents/UW/TA'
alias projects='cd Documents/UW/332/Projects/'
alias sublime='/Applications/Sublime\ Text\ 2.app/Contents/MacOS/Sublime\ Text\ 2 &'
alias sub='sublime'
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
alias difff='git diff --color | diff-so-fancy'


## PATH Shit
# added by Anaconda 2.1.0 installer
export PATH="//anaconda/bin:$PATH"
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
PATH="~/bin:$PATH"
PATH="$PATH:/usr/local/smlnj/bin"
export PATH

# Add GHC 7.8.4 to the PATH, via http://ghcformacosx.github.io/
export GHC_DOT_APP="/Library/ghc-7.8.4.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

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
        PS1+="$Reset\\u@\\h "
    fi
    # Print the working directory and prompt marker in blue, and reset
    # the text color to the default.
    PS1+=": \w$Reset "
    
    # Add git prompt
    PS1+=$(__git_ps1)
    
    # Add virtualenv
    if ! [ -z "$CONDA_PREFIX" ]
    then
        PS1+=" $Green[🐍  $(basename $CONDA_PREFIX)]$Reset"
    fi
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



if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
   . $(brew --prefix)/etc/bash_completion
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="/Users/Hunter/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#----------------------------------------------------------------
# MySQL
#----------------------------------------------------------------
export MYSQL_PS1="(\u@\h) [\d]> "

#----------------------------------------------------------------
# Helpful Aliases
#----------------------------------------------------------------
alias gcal='gcalcli'
alias matlab='/Applications/MATLAB_R2016b.app/bin/matlab'
alias g='git'

eval "$(thefuck --alias)"

#----------------------------------------------------------------
# Helpful Functions
#----------------------------------------------------------------
copy() {
    cat $1 | pbcopy
}

#----------------------------------------------------------------
# Set up that PATH
#----------------------------------------------------------------
export PATH="$PATH:$HOME/.cargo/bin"

#----------------------------------------------------------------
# Rust
#----------------------------------------------------------------
export RUST_SRC_PATH="/usr/local/rust/rustc-1.11.0/src"

#----------------------------------------------------------------
# Secrets
#----------------------------------------------------------------
source ~/.git_secret

#----------------------------------------------------------------
# Startup actions
#----------------------------------------------------------------
