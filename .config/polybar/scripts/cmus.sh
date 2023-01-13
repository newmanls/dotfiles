#!/usr/bin/env bash

getinfo() { grep -w "${1}" <<< "${query}" | sed "s/${1} //1" 2> /dev/null; }

query=$(cmus-remote --query 2> /dev/null) || exit
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

    printf "%s\n" "${info}"
fi
