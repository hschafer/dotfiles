# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH_THEME="powerlevel10k/powerlevel10k"
export ZSH="/Users/Hunter/.oh-my-zsh"
plugins=(git git-auto-fetch zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
  
#----------------------------------------------------------------
# User configuration
#----------------------------------------------------------------
eval "$(thefuck --alias)"
export EDITOR='nvim'
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
 
#----------------------------------------------------------------
# Prompt setup
#----------------------------------------------------------------
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
#  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs anaconda)
#  
#  POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='015'
#  POWERLEVEL9K_ANACONDA_LEFT_DELIMITER=""
#  POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER=""
#  POWERLEVEL9K_ANACONDA_BACKGROUND='002'
#  # POWERLEVEL9K_PYTHON_ICON="🐍"

#----------------------------------------------------------------
# Overriding default commands
#----------------------------------------------------------------
alias vim="nvim"
alias cat="bat"
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias grep='grep --color'
alias cd='cd -P'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh  # fzf for CTRL-R

#  alias ping='prettyping --nolegend'
#  alias top="sudo htop"  # alias top and fix high sierra bug
#  
function chpwd() {
    emulate -L zsh
    ls
}
  
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
alias pod='popd'
alias pud='pushd'

#  
#  # Vim
#  alias vims='vim -S .session'
#  
#  function bim() {
#  	vim "scp://hschafer@barb.cs.washington.edu/$1"
#  
#  
#  function clip() {
#      f=`mktemp`;
#      pbpaste > $f;
#      vim $f;
#      cat $f | pbcopy;
#      rm $f;
#  }
#  
# Misc
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
#  alias gcal='gcalcli'
#  alias note='jupyter notebook'
#  alias dirs='dirs -v'
#  alias op_signin='eval $(op signin my)'
#  alias mount='cd &&  mkdir barb && sshfs hschafer@barb.cs.washington.edu:/cse ~/barb && cd ~/barb'
#  alias unmount='cd && umount barb &&  rm -r ~/barb'
#  
#  bcp() {
#      if [ -z "$2" ]
#      then
#          scp $1 barb:~/$1
#      else
#          scp $1 barb:~/$2
#      fi
#  }
#  
#  
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
  
#  alias colab="jupyter notebook \
#    --NotebookApp.allow_origin='https://colab.research.google.com' \
#    --port=8888 \
#    --NotebookApp.port_retries=0"
  
lec() {
    brigthness 1;
    caffeinate -u -t 3600;
}

javar() {
    javac $1.java && java $1
}
  
#----------------------------------------------------------------
# PATH Shit
#----------------------------------------------------------------

# Anaconda
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/Hunter/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/Hunter/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/Hunter/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/Hunter/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Fix conda in tmux
[[ -z $TMUX ]] || conda deactivate; conda activate base


#  # added tex commands
#  export PATH="/Library/TeX/texbin:$PATH"
#  # add libsvm
#  export PATH="/Library/libsvm-3.20:$PATH"
#  # add scala
#  export SCALA_HOME="/usr/local/share/scala-2.11.6"
#  export PATH="$PATH:$SCALA_HOME/bin"
#  # The orginal version is saved in .bash_profile.pysave
#  PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
#  PATH="~/bin:$PATH"
#  PATH="$PATH:~/go/bin"
#  PATH="$PATH:/usr/local/smlnj/bin"
#  export GHC_DOT_APP="/Library/ghc-7.8.4.app"
#  if [ -d "$GHC_DOT_APP" ]; then
#      export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
#  fi
#  
#  export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#  
#  export NVM_DIR="/Users/Hunter/.nvm"
#  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#  
#  export PATH="$PATH:$HOME/.cargo/bin"
#  export RUST_SRC_PATH="/usr/local/rust/rustc-1.11.0/src"
#  
#  # Coreutils
#  PATH="$PATH:/usr/local/opt/coreutils/libexec/gnubin"
#  MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
#  
#  
#  PATH="$PATH:/Applications/fman.app/Contents/SharedSupport/bin/"
#  export IPYTHONDIR="~/.ipython"
#  
#  # Antlr
#  CLASSPATH=".:/usr/local/lib/antlr-4.6-complete.jar:$CLASSPATH"
#  alias antlr4='java -jar /usr/local/lib/antlr-4.6-complete.jar'
#  alias grun='java org.antlr.v4.gui.TestRig'
#  
#  # Jenv
#   eval "$(jenv init -)"
#  #export PATH="/Users/Hunter/.jenv/shims:${PATH}"
#  #source "/usr/local/Cellar/jenv/0.4.4/libexec/libexec/../completions/jenv.bash"
#  #jenv rehash 2>/dev/null
#  #export JENV_LOADED=1
#  #unset JAVA_HOME
#  #jenv() {
#  #  typeset command
#  #  command="$1"
#  #  if [ "$#" -gt 0 ]; then
#  #    shift
#  #  fi
#  #
#  #  case "$command" in
#  #  enable-plugin|rehash|shell|shell-options)
#  #    eval `jenv "sh-$command" "$@"`;;
#  #  *)
#  #    command jenv "$command" "$@";;
#  #  esac
#  #}
#  
#  # Tmuxinator
#  source ~/.bin/tmuxinator.zsh
#  
#  # MacPorts
#  export PATH=/opt/local/bin:/opt/local/sbin:$PATH
#  export MANPATH=/opt/local/share/man:$MANPATH
#  
#  
#  # Rbenv
#  eval "$(rbenv init -)"
#  
#  #----------------------------------------------------------------
#  # MySQL
#  #----------------------------------------------------------------
#  export MYSQL_PS1="(\u@\h) [\d]> "
#  
#  #----------------------------------------------------------------
#  # Spark
#  #----------------------------------------------------------------
#  #export SPARK_HOME=/usr/local/spark
#  #export PATH=$PATH:$SPARK_HOME/bin
#  
#  
#  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
#  export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH
#  
#  if [ -n "$TMUX" ]; then
#      conda deactivate
#      conda activate base
#  fi
#  
#  source /Users/Hunter/Library/Preferences/org.dystroy.broot/launcher/bash/br
