#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

## Set display resolution
# xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
# xrandr --addmode Virtual-1 1920x1080_60.00
# xrandr --output Virtual-1 --mode 1920x1080_60.00
#
## For external display
# xrandr --output HDMI-1 --off
# bash ~/Projects/duplicate-display-script/script.sh connect

## Load wallpaper, compositor, screensaver, and scripts
bash ~/Projects/Power-Notify/power-notify.sh &
dwmblocks &
nitrogen --restore &
picom &
~/Projects/xssstate/xsidle.sh slock &

## start emacs daemon
emacs --daemon &

## start dwm
exec dwm
