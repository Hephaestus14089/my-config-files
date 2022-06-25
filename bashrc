# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

####################################################
####################################################
####                                            ####
####             MY CUSTOM .bashrc              ####
####                                            ####
####################################################
####################################################

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lal='ls -Al'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#####################################################################
##                                                                 ##
##                  spark source code functions                    ##
##                                                                 ##
#####################################################################

_echo()
{
  if [ "X$1" = "X-n" ]; then
    shift
    printf "%s" "$*"
  else
    printf "%s\n" "$*"
  fi
}

spark()
{
  local n numbers=

  # find min/max values
  local min=0xffffffff max=0

  for n in ${@//,/ }
  do
    # on Linux (or with bash4) we could use `printf %.0f $n` here to
    # round the number but that doesn't work on OS X (bash3) nor does
    # `awk '{printf "%.0f",$1}' <<< $n` work, so just cut it off
    n=${n%.*}
    (( n < min )) && min=$n
    (( n > max )) && max=$n
    numbers=$numbers${numbers:+ }$n
  done

  # print ticks
  local ticks=(▁ ▂ ▃ ▄ ▅ ▆ ▇ █)

  # use a high tick if data is constant
  (( min == max )) && ticks=(▅ ▆)

  local f=$(( (($max-$min)<<8)/(${#ticks[@]}-1) ))
  (( f < 1 )) && f=1

  for n in $numbers
  do
    _echo -n ${ticks[$(( ((($n-$min)<<8)/$f) ))]}
  done
  _echo
}

# If we're being sourced, don't worry about such things
if [ "$BASH_SOURCE" == "$0" ]; then
  # Prints the help text for spark.
  help()
  {
    local spark=$(basename $0)
    cat <<EOF
    USAGE:
      $spark [-h|--help] VALUE,...
    EXAMPLES:
      $spark 1 5 22 13 53
      ▁▁▃▂█
      $spark 0,30,55,80,33,150
      ▁▂▃▄▂█
      echo 9 13 5 17 1 | $spark
      ▄▆▂█▁
EOF
  }

  # show help for no arguments if stdin is a terminal
  if { [ -z "$1" ] && [ -t 0 ] ; } || [ "$1" == '-h' ] || [ "$1" == '--help' ]
  then
    help
    exit 0
  fi

  spark ${@:-`cat`}
fi

#################################################
#####      Spark source code ends here      #####
#################################################

####    spark aliases    ####
clear() {

    /bin/clear;

    echo;
    echo;
    
    n=`tput cols`;
    spark `seq 1 $n | sort -R` | lolcat;

    echo;
    echo;
} # spark alias for clear ends here

# clear alias
alias clr='clear'

# .bashrc alias
alias config='vim ~/.bashrc'

# git aliases
alias gstatus='git status'
alias glog='git log --oneline'
alias gadd='git add --all'
alias gpush='git push'

####    Invoking neofetch at every bash session's start    ####
neofetch --disable Icons Packages Kernel resolution wm gpu --cpu_brand off --cpu_speed off --color_blocks off
