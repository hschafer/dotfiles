source ~/.bashrc
##
# Your previous /Users/Hunter/.bash_profile file was backed up as /Users/Hunter/.bash_profile.macports-saved_2016-04-07_at_16:54:46
##

# Bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# MacPorts Installer addition on 2016-04-07_at_16:54:46: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# added by Anaconda3 4.2.0 installer
export PATH="/Users/Hunter/anaconda/bin:$PATH"

# added by Anaconda3 4.2.0 installer
export PATH="/Users/Hunter/anaconda3/bin:$PATH"

# load rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - --no-rehash)"

# Start tmux on login
# tmux

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# added by Anaconda3 4.4.0 installer
export PATH="/Users/Hunter/anaconda/bin:$PATH"

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH
