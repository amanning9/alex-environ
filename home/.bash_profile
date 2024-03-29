#~/.bash_profile gets ~/.bashrc!!
export AE_ROOT="$HOME/.alex-environ"
export AE_HOME="$AE_ROOT/home"

#Add user bin directory to $PATH
PATH=$HOME/.cargo/bin:$PATH
PATH=$HOME/.local/bin:$PATH
PATH=$HOME/.config/composer/vendor/bin/:$PATH
PATH=$HOME/scripts:$PATH
PATH=$AE_HOME/.local/bin:$PATH
PATH=$AE_HOME/scripts:$PATH
PATH=/opt/bin:$PATH
export PATH

# If not running interactively, don't do anything else
[[ $- != *i* ]] && return

#Start an agent upon login, or reconnect to a started agent
if [ -f ~/.alex-environ/home/scripts/ssh_agent_setup ]; then
    . ~/.alex-environ/home/scripts/ssh_agent_setup
fi

# Variable overrides
vimpath="\vim"
export EDITOR="$vimpath"
export VISUAL="$vimpath"
export SYSTEMD_EDITOR="$vimpath"
export SUDO_EDITOR="$vimpath"

# Fix GPG Bug on WSL.
export GPG_TTY=$(tty)

# Allow DNSSEC Resolving.
export RES_OPTIONS=edns0

#Setup less
export LESS="--ignore-case --status-column -M -R -W --tabs=4 --window=-4"
LESSOPEN="|lesspipe.sh %s"; export LESSOPEN
if type pygmentize >/dev/null 2>&1; then
    export LESSCOLORIZER='pygmentize'
fi

export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export GROFF_NO_SGR=1         # For Konsole and Gnome-terminal

# Pretty LS Colors
export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mng=01;35:*.pcx=01;35:*.yuv=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.pdf=00;32:*.ps=00;32:*.txt=00;32:*.patch=00;32:*.diff=00;32:*.log=00;32:*.tex=00;32:*.doc=00;32:*.flac=01;35:*.mp3=01;35:*.mpc=00;36:*.ogg=00;36:*.wav=00;36:*.mid=00;36:*.midi=00;36:*.au=00;36:*.flac=00;36:*.aac=00;36:*.ra=01;36:*.mka=01;36:"

# 1password sudo stuff.
if [ -n "${sudo_pass_uuid}" ]
then
    export SUDO_ASKPASS=$AE_HOME/scripts/askpass.sh
fi

source $AE_HOME/.bashrc.d/functions.sh
