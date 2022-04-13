#!/usr/bin/env bash

timer=5

# Options
select="麗"
window="类"
screen=""
delay=""
cancel=""

# Variable passed to rofi
options="$select\n$window\n$screen\n$delay\n$cancel"

rofi_command="rofi -theme themes/screenshotsmenu.rasi"

setFilename() {
  directory="/tmp/"
  filename="IMG_$(date +%Y%m%d_%H%M%S).jpg"
  filepath=$directory$filename
}

notify() {
  dunstify "Screenshot saved and copied to clipboard" -i accessories-screenshot
}

chosen="$(echo -e "$options" | $rofi_command -dmenu)"
case $chosen in
  $select)
    setFilename
    maim -Buosd 0.25 \
      | tee $filepath | xclip -selection c -t image/png
    notify
    ;;
  $window)
    setFilename
    maim -Buod 0.25 -i $(xdotool getactivewindow) \
      | tee $filepath | xclip -selection c -t image/png
    notify
    ;;
  $screen)
    setFilename
    maim -Buod 0.25 \
      | tee $filepath | xclip -selection c -t image/png
    notify
    ;;
  $delay)
    setFilename
    maim -Buod $timer \
      | tee $filepath | xclip -selection c -t image/png
    notify
    ;;
esac
