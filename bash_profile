#
# ~/.bash_profile
#

#Enviornment variables

export EDITOR=vim
export BROWSER=firefox
export PATH=$PATH:~/bin

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start X by default on tty 1
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
