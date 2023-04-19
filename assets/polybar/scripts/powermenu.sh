#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

uptime=$(uptime -p | sed -e 's/up //g')

# Options
lock=" Lock"
logout=" Logout"
suspend=" Sleep"
shutdown=" Shutdown"
reboot=" Restart"

# Variable passed to rofi
options="$lock\n$logout\n$suspend\n$shutdown\n$reboot"

chosen="$(echo -e "$options" | rofi -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
"$lock")
	i3lock 1 4 -n
	;;
"$logout")
	i3-msg exit
	;;
"$suspend")
	systemctl suspend
	;;
"$shutdown")
	systemctl poweroff
	;;
"$reboot")
	systemctl reboot
	;;
esac
