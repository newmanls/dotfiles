#!/usr/bin/env bash

directory="${HOME}/Pictures/Screenshots"
timer_delay=3

take_screenshot() {
    args="${@}"
    filename="IMG_$(date +%Y%m%d_%H%M%S).png"
    filepath="${directory}/${filename}"

    maim -Bud 0.1 ${args} "${filepath}"

    if [ -f "${filepath}" ]; then
        xclip -selection clipboard -t image/png -i "${filepath}"
        notify-send -i "${filepath}" \
            "Screenshot captured" "You can paste the image from the clipboard."
    fi
}

screen=""
window="类"
region="麗"
timer=""
cancel=""

options="${screen}\n${window}\n${region}\n${timer}\n${cancel}"

chosen=$(echo -e "${options}" | rofi \
    -theme themes/screenshotsmenu.rasi -dmenu -hover-select \
    -me-select-entry '' -me-accept-entry MousePrimary)

case "${chosen}" in
    "${screen}") take_screenshot ;;
    "${window}") take_screenshot -i $(xdotool getactivewindow) ;;
    "${region}") take_screenshot -so ;;
    "${timer}")  take_screenshot -d ${timer_delay} ;;
esac
