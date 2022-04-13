#!/bin/bash

WM_DESKTOP=$(xdotool getwindowfocus)

if [ $WM_DESKTOP == "224" ]; then
  echo ""
elif [ $WM_DESKTOP != "1883" ]; then
  WM_CLASS=$(xprop -id $(xdotool getactivewindow) WM_CLASS \
    | awk 'NF {print $NF}' | sed 's/"//g')
  WM_NAME=$(xprop -id $(xdotool getactivewindow) WM_NAME \
    | cut -d '=' -f 2 | awk -F\" '{print $2}')

  case $WM_CLASS in
    "st"|'Qalculate-gtk')
      echo $WM_NAME
      ;;
    *)
      echo $WM_CLASS
      ;;
  esac
fi
