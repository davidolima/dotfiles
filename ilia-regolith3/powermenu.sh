#!/bin/bash
options=$(cat << EOM
Lock
Logout
Reboot
Power off
EOM
)
title="PowerMenu"

selection=$(echo "$options" |ilia -l $title -p textlist)
case $selection in
	"Power off" )	
	/usr/bin/gnome-session-quit --power-off;;
	"Reboot" )
	/usr/bin/gnome-session-quit --reboot;;
	"Logout" )
	/usr/bin/gnome-session-quit --logout;;
	"Lock" )
	/usr/bin/i3lock-fancy -gp;;
esac
