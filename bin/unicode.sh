#!/bin/sh

# A copy/edit of Luke Smith's voidrice script, taken from
# here: https://github.com/LukeSmithxyz/voidrice/blob/archi3/.local/bin/i3cmds/dmenuunicode
# Uses rofi instead of dmenu. The rest should be the smae


# Give dmenu list of all unicode characters to copy.
# Shows the selected character in dunst if running.

# Must have xclip installed to even show menu.
# xclip -h >/dev/null || exit

if [ -e ~/.config/fontawesome ]; then
    chosen=$(grep -v "#" -h ~/.config/emoji ~/.config/fontawesome | rofi -dmenu -i -l 20 -fn Monospace-18)
else
    chosen=$(grep -v "#" ~/.config/emoji | rofi -dmenu  -i -l 20 -fn Monospace-18)
fi

[ "$chosen" != "" ] || exit

c=$(echo "$chosen" | sed "s/ .*//")
echo "$c" | tr -d '\n' | xclip -selection clipboard
notify-send "'$c' copied to clipboard." &

s=$(echo "$chosen" | sed "s/.*; //" | awk '{print $1}')
echo "$s" | tr -d '\n' | xclip
notify-send "'$s' copied to primary." &
