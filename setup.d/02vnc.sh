#!/bin/bash

# setup vnc
sudo apt install tigervnc-standalone-server tigervnc-viewer 

# stop graphical login
sudo systemctl set-default multi-user.target

cd 
mkdir .vnc
ln -s projects/dotfiles/xstartup .vnc

# vnc
# -localhost no -xstartup ~/.vnc/xstartup -geometry 2500x1280 :1
# need `export $(dbus-launch)` to run gnome-terminal
# crontab wakaran
# 
# VirtualBox NAT <empty> 5901 <empty> 5901

# Now vnc can't connect multi session in 1 user.
# even when DISPLAY=:1, windows open in :0
