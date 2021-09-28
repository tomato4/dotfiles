#!/bin/env bash

# start visual apps such as compositor, wallpaper etc.
picom -b --experimental-backend
nitrogen --restore
redshift-gtk &

# start audio system
start-pulseaudio-x11 &
pa-applet &

# set keyboard settings (TODO: make it system default)
setxkbmap cz -model pc105 &
xset r rate 150 50 &
