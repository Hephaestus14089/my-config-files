##
##  ~/.bashrc
##

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# set environment variables
# export PATH=/home/bhargav/.emacs.d/bin:/home/bhargav/go/bin:/home/bhargav/.local/bin/:/home/bhargav/.cargo/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
export EDITOR=emacs
export VISUAL=vim
export RANGER_LOAD_DEFAULT_RC=false

HISTCONTROL=ignoredups

alias ls='ls --color=auto'

#####  More aliases  #####

# Config alias
alias config='vim ~/.bashrc'
alias xconfig='vim ~/.xinitrc'
alias alacrittyconfig='vim ~/.config/alacritty/alacritty.yml'

# Navigation aliases
alias la='ls -A'
alias lr='ls -R'
alias lal='ls -Al'
alias ll='ls -l'
alias l='ls -1'

alias ..='cd ../'
alias ..2='cd ../../'
alias ..3='cd ../../../'
alias ..4='cd ../../../../'
alias ..5='cd ../../../../../'

# Git aliases
alias gpush='git push'
alias gpull='git pull'
alias gadd='git add --all'
alias gstatus='git status'
alias gsts='gstatus'
alias glog='git log --oneline'
alias gcommit='git commit -m'
alias gclone='git clone'
alias gconfig='git config'

# Clear alias
alias clr='clear'

# Messages
val=$(( `seq 1 3 | sort -R | head -n 1` ))

if [ $val -eq 1 ]
then
	figlet -t "Arch  Linux"; echo
elif [ $val -eq 2 ]
then
	figlet -t "I  use  Arch  btw ." | lolcat; echo
else
	pfetch
fi

# PS1='[\u@\h \W]\$ '
# PS1='[\u@\h \W]\n\$ '

eval "$(starship init bash)"
