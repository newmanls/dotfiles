#!/usr/bin/env bash

set -euo pipefail

is_installed() {
    which "${1}" > /dev/null 2>&1
}

sb_backlight() {
    local backlight max_brightness actual_brightness brightness icon

    backlight="/sys/class/backlight/intel_backlight/"

    [ -d "${backlight}" ] || return 0

    max_brightness=$(cat "${backlight}/max_brightness")
    actual_brightness=$(cat "${backlight}/actual_brightness")

    brightness=$(((100 * actual_brightness + max_brightness / 2) / max_brightness))

    if   [ "${brightness}" -lt 30 ]; then icon=" "
    elif [ "${brightness}" -lt 70 ]; then icon=" "
    else icon=" "; fi

    printf "%s %s%%" "${icon}" "${brightness}"
}

sb_battery() {
    local battery status capacity icon

    battery="/sys/class/power_supply/BAT1/"

    [ -d "${battery}" ] || return 0

    status=$(cat "${battery}/status")
    capacity=$(cat "${battery}/capacity")

    if [ "${status}" = "Charging" ]; then icon=""
    elif [ "${capacity}" -eq 100 ];  then icon=""
    elif [ "${capacity}" -gt 80 ];   then icon=""
    elif [ "${capacity}" -gt 60 ];   then icon=""
    elif [ "${capacity}" -gt 40 ];   then icon=""
    elif [ "${capacity}" -gt 20 ];   then icon=""
    else icon=""; fi

    printf "%s %s%%" "${icon}" "${capacity}"
}

sb_cmus() {
    is_installed cmus || return 0

    local max_length query status artist title info file info

    max_length=90   # Label max length. Setting it to 0 disables cut-off.

    getinfo() {
        grep -w "${1}" <<< "${query}" | sed "s/${1} //1" 2> /dev/null
    }

    query=$(cmus-remote -Q 2> /dev/null) || return 0
    status=$(getinfo "status")

    if [ "${status}" != "stopped" ]; then
        artist=$(getinfo "tag artist")
        title=$(getinfo "tag title")

        if [ "${artist}" ] && [ "${title}" ]; then
            info="${artist} - ${title}"
        else
            file=$(getinfo "file")
            info=$(basename "${file%.*}")
        fi

        (( max_length > 0 && ${#info} > max_length )) &&
            info="${info:0:(( max_length - 1 ))}…"

        printf "  %s" "${info}"
    fi
}

sb_date() {
    date +"%a %b %d %R"
}

sb_mpd() {
    is_installed mpc || return 0

    local current

    current=$(mpc current)

    [ "${current}" ] && printf "  %s" "${current}"
}

sb_volume() {
    is_installed pamixer || return 0

    local vol volume is_muted icon

    vol=$(pamixer --get-volume)
    volume=$(pamixer --get-volume-human)
    is_muted=$(pamixer --get-mute)

    if [ "${is_muted}" = "true" ]; then
        icon="ﱝ"
    elif [ "${vol}" -lt 30 ]; then
        icon="奄"
    elif [ "${vol}" -lt 70 ]; then
        icon="奔"
    else
        icon="墳"
    fi

    printf "%s %s" "${icon}" "${volume}"
}

sb_wifi() {
    is_installed nmcli || return 0

    local ssid
    ssid=$(nmcli -t -g name connection show --active | grep -xv lo)

    if [ "${ssid}" ]; then
        printf "直  %s" "${ssid}"
    else
        printf "睊  disconnected"
    fi
}

print_help() {
    printf "%s\n" \
        "USAGE:" \
        "  dwmsb [MODULES]" \
        "" \
        "MODULES:" \
        "  backlight battery cmus date mpd volume wifi" \
        "" \
        "OPTIONS:" \
        "  -h, --help    Print this help page"
}

main() {
    local modules status

    modules="${*}"

    while true; do
        status=''

        for module in ${modules}; do
            module_output=$(sb_"${module}")
            [ "${module_output}" ] && status+=" ${module_output} "
        done

        xprop -root -set WM_NAME "${status}" && sleep 0.5
    done
}

case "${@}" in
    '')        print_help && exit 1 ;;
    -h|--help) print_help ;;
    *)         main "${@}" ;;
esac
