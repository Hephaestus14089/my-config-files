# Files in conf.d can be overridden by the user
# by files with the same name in $XDG_CONFIG_HOME/fish/conf.d

# This file is run by all fish instances.
# To include configuration only for login shells, use
# if status --is-login
#    ...
# end
# To include configuration only for interactive shells, use
# if status --is-interactive
#   ...
# end


set fish_greeting ""

######################    aliases    ########################

alias clr 'clear'
alias config 'vim ~/.config/fish/config.fish'
alias alacrittyconfig 'vim ~/.config/alacritty/alacritty.yml'
alias shtdn 'shutdown -P now'
alias frfox 'firefox 1>/dev/null 2>&1 &'
alias emac 'emacs ./ 1>/dev/null 2>&1 &'
alias change-brightness 'sudo vim /sys/class/backlight/intel_backlight/brightness'
alias suspend-ram 'systemctl suspend'
alias sys-up 'sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'
alias sys-up-man 'sudo apt update && sudo apt upgrade && sudo apt autremove'

# navigation
alias l 'ls -1'
alias ll 'ls -Al'
alias la 'ls -a'
alias lal 'ls -al'
alias lr 'ls -R'
alias ..1 'cd ../'
alias ..2 'cd ../../'
alias ..3 'cd ../../../'
alias ..4 'cd ../../../../'
alias ..5 'cd ../../../../../'
alias .. '..1'

# git
alias gpull 'git pull'
alias gpush 'git push'
alias gclone 'git clone'
alias gadd 'git add --all'
alias gcommit 'git commit -m'
alias gstatus 'git status'
alias gsts 'gstatus'
alias glog 'git log --oneline'
alias gbranch 'git branch'
alias gswitch 'git switch'
alias gcheckout 'git checkout'
alias gtag 'git tag'
alias gconfig 'git config'
alias ghclone 'gh repo clone'

# some pretty output to decorate the terminal
set val (seq 1 4 | sort -R | head -n 1)

if test "$val" -eq 1
	figlet "Debian" | lolcat
else if test "$val" -eq 2
	fm6000 -m 10 -g 10 -l 20 -r -color random
else if test "$val" -eq 3
	pfetch
else
	neofetch
end

# starship terminal
starship init fish | source
