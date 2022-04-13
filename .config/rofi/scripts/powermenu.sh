#!/usr/bin/env bash

rofi_command="rofi -show drun -theme themes/powermenu.rasi"

# Options
shutdown="襤"
reboot="勒"
suspend=""
logout="﫼"
cancel=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$suspend\n$logout\n$cancel"
chosen="$(echo -e "$options" | $rofi_command -dmenu )"

case $chosen in
    $shutdown)
      systemctl poweroff -i ;;
    $reboot)
      systemctl reboot ;;
    $suspend)
      systemctl suspend ;;
    $logout)
      pkill -KILL -u $(whoami) ;;
    $cancel) ;;
esac
