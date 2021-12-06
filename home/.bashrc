#Alex's global .bashrc

# If not running interactively, don't do anything else
[[ $- != *i* ]] && return

#SET PATH IN .BASH_PROFILE

#don't put duplicate lines or lines beginning with a space into history
HISTCONTROL=ignoreboth

#append to the history file, don't overwrite it
shopt -s histappend

#set some max sizes for the history
HISTSIZE=1000
HISTFILESIZE=2000

#resize window each command
shopt -s checkwinsize

#set pretty colors for LS
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias jprint='python3 -m json.tool'
alias sl='ls --color=auto'
alias vim='vim -p'

# Onepassword sudo stuff.
if [ -n "${sudo_pass_uuid}" ]
then
    alias sudo='sudo -A'
fi

