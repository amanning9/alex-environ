#Alex's global .bashrc

# If not running interactively, don't do anything else
[[ $- != *i* ]] && return

#SET PATH IN .BASH_PROFILE
# Set the shell's editor to vi mode
set -o vi

#don't put duplicate lines or lines beginning with a space into history
HISTCONTROL=ignoreboth

#append to the history file, don't overwrite it
shopt -s histappend

#set some max sizes for the history
HISTSIZE=1000
HISTFILESIZE=2000

#resize window each command
shopt -s checkwinsize

#some useful aliases
alias ls='ls --color=auto'
alias jprint='python3 -m json.tool'
alias sl='ls --color=auto'
alias vim='vim -p'

# Onepassword sudo stuff.
if [ -n "${sudo_pass_uuid}" ]
then
    alias sudo='sudo -A'
fi

# Fix the horrible shell that poetry gives you.
if [ -n "$POETRY_ACTIVE" ]
then
    export VIRTUAL_ENV_DISABLE_PROMPT=1
    cwd=$(pwd)
    export PS1="\[\033[48;5;27m\]${cwd##*/}\[$(tput sgr0)\] 🖋️📜 "
fi

# Exclude some folders from grep by default.
alias grep='grep --color=auto --exclude-dir=".mypy_cache" --exclude-dir=".git" --exclude-dir=".tox" --exclude-dir="__pycache__"'
