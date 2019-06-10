#!/bin/bash

LOCKER="bash $HOME/.config/i3/lock.sh && sleep 1"

selection=$(echo -e "Lock\nSuspend\nHibernate\nShutdown" | rofi -dmenu)
case $selection in 
  Lock)
    eval $LOCKER
    ;;
  Suspend)
    eval $LOCKER && systemctl suspend 
    ;;
  Hibernate)
    eval systemctl hibernate && $LOCKER
    ;;
  Shutdown)
    systemctl poweroff
    ;;
esac
