#!/bin/bash
while [ "$select" != "CANCEL" -a "$select" != "LOGOUT" -a "$select" != "POWEROFF" -a "$select" != "REBOOT" -a "$select" != "SUSPEND" -a "$select" != "HIBERNATE" ];
	
do
	select=$(echo -e 'CANCEL\nLOGOUT\nSUSPEND\nHIBERNATE\nPOWEROFF\nREBOOT' | dmenu -nb '#000000' -nf '#00FF00' -sb '#00FF00' -sf '#000000' -fn '-*-*-medium-r-normal-*-*-*-*-*-*-100-*-*' -i -p "You pressed the exit shortcut. Do you really want to exit i3?")
	[ -z "$select" ] && exit 0
done

[ "$select" = "CANCEL" ] && exit 0
[ "$select" = "LOGOUT" ] && i3-msg exit
[ "$select" = "SUSPEND" ] && systemctl suspend
[ "$select" = "SUSPEND" ] && systemctl hibernate
[ "$select" = "POWEROFF" ] && systemctl poweroff -i
[ "$select" = "REBOOT" ] && systemctl reboot

