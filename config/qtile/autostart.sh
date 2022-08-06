#!/bin/sh

# Daemon for the battery icon
cbatticon -u 5 &

# Daemon for the eye-care utility
redshift-gtk & disown

# Settings for the second monitor
# xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x172 --rotate normal --output HDMI-1-0 --mode 1366x768 --pos 1920x0 --rotate normal
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 1366x73 --rotate normal --output HDMI-1-0 --mode 1366x768 --pos 0x0 --rotate normal

# Restore brightness with a backlight utility
# light -I

# Setting the wallpaper for the desktop
nitrogen --restore

# Daemon for the compositor
picom --config $HOME/.config/qtile/scripts/picom.conf &

# Daemon for the Network Manager utility
nm-applet &

# Daemon for the mount/unmount utility
udiskie -t &

# Setting the keyboards layouts
setxkbmap -layout us,latam -option grp:win_space_toggle

# Setting the numlock in the keyboard
numlockx &

# Power Manager from Xfce
xfce4-power-manager &

# Daemon for Bluetooth
# blueberry-tray &
blueman-applet &

# Policies
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Notifications
/usr/lib/xfce4/notifyd/xfce4-notifyd &

# Hybrid Graphics
optimus-manager-qt &
