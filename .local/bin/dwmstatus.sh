#!/usr/bin/env bash

sb_battery() {
    local status=$(cat /sys/class/power_supply/BAT1/status)
    local percentage=$(cat /sys/class/power_supply/BAT1/capacity)
    local icon

    if [ $status == 'Charging' ]; then
        if [ $percentage -lt 20 ]; then
            icon=''
        elif [ $percentage -lt 30 ]; then
            icon=''
        elif [ $percentage -lt 40 ]; then
            icon=''
        elif [ $percentage -lt 60 ]; then
            icon=''
        elif [ $percentage -lt 80 ]; then
            icon=''
        elif [ $percentage -lt 100 ]; then
            icon=''
        else
            icon=''
        fi
    else
        if [ $percentage -lt 10 ]; then
            icon=''
        elif [ $percentage -lt 20 ]; then
            icon=''
        elif [ $percentage -lt 40 ]; then
            icon=''
        elif [ $percentage -lt 60 ]; then
            icon=''
        elif [ $percentage -lt 80 ]; then
            icon=''
        elif [ $percentage -lt 100 ]; then
            icon=''
        else
            icon=''
        fi
    fi

    echo "$icon $percentage%  "
}

sb_date() {
    date +"%a %b %d %R"
}

sb_network() {
    local icon

    if [[ $(ip r) ]] ; then
        icon='直 '
    else
        icon='睊 '
    fi

    echo "$icon  "
}

# sb_mpd() {
#     if [[ $(mpc current) ]] ; then
#         echo "  $(mpc current)  "
#     fi
# }

sb_volume() {
    local vol=$(pamixer --get-volume)
    local volume=$(pamixer --get-volume-human)
    local is_muted=$(pamixer --get-mute)
    local icon

    if [ $is_muted = 'true' ]; then
        icon='ﱝ'
    elif [ $vol -lt 30 ]; then
        icon='奄'
    elif [ $vol -lt 70 ]; then
        icon='奔'
    else
        icon='墳'
    fi

    echo "$icon $volume  "
}

while true; do
    xsetroot -name " $(sb_volume)$(sb_battery)$(sb_network)$(sb_date) "
    sleep 0.5s 
done
