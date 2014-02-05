#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Command replacements
alias ls='ls --color=auto'
# Vim caldendar
alias calendar='vim -c Caldendar'
alias vcal='vim -c Calendar'

if [ "$TERM" = "linux" ]; then
  [[ -f ~/.bash_console ]] && . ~/.bash_console
fi

PS1='\[\033[0;31m\][\w] » \[\033[0;0m\]'
