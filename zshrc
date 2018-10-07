# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/Hunter/.oh-my-zsh"
ZSH_THEME="agnoster"

plugins=(
  git
)
source $ZSH/oh-my-zsh.sh

#----------------------------------------------------------------
# User configuration
#----------------------------------------------------------------
eval "$(thefuck --alias)"
export EDITOR='nvim'
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#----------------------------------------------------------------
# Overriding default commands
#----------------------------------------------------------------

alias vim="nvim"
alias cat="bat"
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh  # fzf for CTRL-R
alias top="sudo htop"  # alias top and fix high sierra bug
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias grep='grep --color'
alias cd='cd -P'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'

#----------------------------------------------------------------
# Helpful aliases
#----------------------------------------------------------------

# Moving around
alias ll='ls -a'
alias ..='cd ../'
alias ...='cd ../../'
alias .2='cd ../..'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'


# Vim
alias vims='vim -S .session'

function clip() {
    f=`mktemp`;
    pbpaste > $f;
    vim $f;
    cat $f | pbcopy;
    rm $f;
}

# Misc
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias gcal='gcalcli'
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
alias note='jupyter notebook'
alias pod='popd'
alias pud='pushd'
alias dirs='dirs -v'


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

copy() {
    cat $1 | pbcopy
}



#----------------------------------------------------------------
# PATH Shit
#----------------------------------------------------------------

# Anaconda
export PATH="//anaconda/bin:$PATH"
# added tex commands
export PATH="/Library/TeX/texbin:$PATH"
# add libsvm
export PATH="/Library/libsvm-3.20:$PATH"
# add scala
export SCALA_HOME="/usr/local/share/scala-2.11.6"
export PATH="$PATH:$SCALA_HOME/bin"
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
PATH="~/bin:$PATH"
PATH="$PATH:~/go/bin"
PATH="$PATH:/usr/local/smlnj/bin"
export GHC_DOT_APP="/Library/ghc-7.8.4.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="/Users/Hunter/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.cargo/bin"
export RUST_SRC_PATH="/usr/local/rust/rustc-1.11.0/src"

# Coreutils
PATH="$PATH:/usr/local/opt/coreutils/libexec/gnubin"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"


PATH="$PATH:/Applications/fman.app/Contents/SharedSupport/bin/"
export IPYTHONDIR="~/.ipython"

# Antlr
CLASSPATH=".:/usr/local/lib/antlr-4.6-complete.jar:$CLASSPATH"
alias antlr4='java -jar /usr/local/lib/antlr-4.6-complete.jar'
alias grun='java org.antlr.v4.gui.TestRig'

# Jenv
export PATH="/Users/Hunter/.jenv/shims:${PATH}"
source "/usr/local/Cellar/jenv/0.4.4/libexec/libexec/../completions/jenv.bash"
jenv rehash 2>/dev/null
export JENV_LOADED=1
unset JAVA_HOME
jenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}

#----------------------------------------------------------------
# MySQL
#----------------------------------------------------------------
export MYSQL_PS1="(\u@\h) [\d]> "


