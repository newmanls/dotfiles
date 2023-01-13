#!/bin/bash

window_id=$(xdotool getwindowfocus)

case "${window_id}" in
    544|8388688)
        printf "\n" ;;
    *)
        wm_props=$(xprop -id "${window_id}" WM_CLASS WM_NAME)
        wm_class=$(grep WM_CLASS <<< "${wm_props}" | cut -d '"' -f 4)
        wm_name=$(grep WM_NAME <<< "${wm_props}" | cut -d '"' -f 2)

        case "${wm_class}" in
            # print WM_CLASS instead of WM_NAME
            null)
                printf "%s\n" "${wm_class}" ;;
            *)
                printf "%s\n" "${wm_name}" ;;
        esac
        ;;
esac
