#!/bin/sh
qdbus org.keepassxc.KeePassXC.MainWindow /keepassxc org.keepassxc.MainWindow.lockAllDatabases
# disable dunst notification
pkill -u "$USER" -USR1 dunst

# normal i3lock
i3lock -n -c 000000 -e

# re-enable notifications
pkill -u "$USER" -USR2 dunst


# scrot /tmp/screen.png
# convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
# [[ -f $1 ]] && convert /tmp/screen.png $1 -gravity center -composite -matte /tmp/screen.png

# i3lock-color
# i3lock -S 1 \
#   --force-clock \
#   --insidecolor 00000000 \
#   --datestr="%F %A" \
#   --datesize=25 \
#   --datepos="tx:ty+50" \
#   --timecolor=FD971Ffa \
#   --datecolor=FD971Ffa \
#   --verifcolor=66D9EFfa \
#   --timepos="ix:iy-350" \
#   --wrongcolor=FFFFFFff \
#   --separatorcolor=FD971F00 \
#   --insidewrongcolor=d81662a0 \
#   --insidevercolor=46B9DFff \
#   --ringcolor=A6E22Eff \
#   --radius 120 \
#   --ring-width 12.0 \
#   -c 000000
#
