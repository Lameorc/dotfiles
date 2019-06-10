#!/bin/bash
echo "$HOME/.Xresources" | entr bash -c 'xrdb "$HOME/.Xresources"; notify-send -a "entr" "reloaded Xresources"'
