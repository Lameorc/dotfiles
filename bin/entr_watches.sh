#!/bin/sh
echo "$HOME/.Xresources" | entr sh -c 'xrdb "$HOME/.Xresources"; notify-send -a "entr" "reloaded Xresources"'
