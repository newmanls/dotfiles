#!/usr/bin/env bash

# Options
shutdown="襤"
reboot="勒"
suspend=""
logout="﫼"
cancel=""

options="${shutdown}\n${reboot}\n${suspend}\n${logout}\n${cancel}"

chosen=$(echo -e "${options}" | rofi \
    -theme themes/powermenu.rasi -dmenu -hover-select \
    -me-select-entry '' -me-accept-entry MousePrimary)

case "${chosen}" in
    "${shutdown}") systemctl poweroff -i ;;
    "${reboot}")   systemctl reboot ;;
    "${suspend}")  systemctl suspend ;;
    "${logout}")   pkill -KILL -u $(whoami) ;;
esac
