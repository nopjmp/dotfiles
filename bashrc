#
# ~/.bashrc
#

# Command replacements
alias ls='ls --color=auto'
# Vim caldendar
alias calendar='vim -c Caldendar'
alias vcal='vim -c Calendar'

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:/opt/android-sdk/platform-tools:/opt/android-sdk/tools

if [ "$TERM" = "linux" ]; then
  [[ -f ~/.bash_console ]] && . ~/.bash_console
fi

PS1='\[\033[0;31m\][\w] » \[\033[0;0m\]'
