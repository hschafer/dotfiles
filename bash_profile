#source ~/.bashrc

##
# Your previous /Users/Hunter/.bash_profile file was backed up as /Users/Hunter/.bash_profile.macports-saved_2016-04-07_at_16:54:46
##

# MacPorts Installer addition on 2016-04-07_at_16:54:46: adding an appropriate PATH variable for use with MacPorts.
#export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Source global defs
#if [ -f /etc/bashrc ]; then
#    . /etc/bashrc
#fi

#if [ -f ~/.profile ]; then
#    source ~/.profile
#fi

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
