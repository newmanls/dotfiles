#!/bin/sh

set -C -f

FILE="$1"
FILE_EXTENSION=$(echo "${FILE##*.}" | tr '[:upper:]' '[:lower:]')
FILE_MIMETYPE=$(file --dereference --brief --mime-type -- "$FILE")

PV_WIDTH="$(($2-2))"
PV_HEIGHT="$3"
PV_X="$(($4+2))"
PV_Y="$5"

get_cache() {
    CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/lf/thumb.$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$1" | sha256sum | awk '{print $1}')"
}

image_pv() {
    if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
        printf '{"action": "add", "identifier": "PREVIEW", "x": "%s", "y": "%s", "width": "%s", "height": "%s", "scaler": "contain", "path": "%s"}\n' "$PV_X" "$PV_Y" "$PV_WIDTH" "$PV_HEIGHT" "$1" > "$FIFO_UEBERZUG"
    fi
}

# Handle extension
case "$FILE_EXTENSION" in
    7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|iso|jar|lha|lz|lzh|lzma| \
    lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
        get_cache $FILE
        [ ! -f "$CACHE" ] && atool --list -- "$FILE" > "$CACHE"
        cat "$CACHE" && exit 1 ;;
esac

# Handle mimetype
case "$FILE_MIMETYPE" in
    image/*)
        image_pv "$FILE" && exit 1 ;;

    video/*)
        get_cache $FILE
        [ ! -f "$CACHE" ] && ffmpegthumbnailer -i "$FILE" -o "$CACHE" -s 0
        image_pv "$CACHE" && exit 1 ;;

    application/pdf)
        get_cache $FILE
        [ ! -f "$CACHE.jpg" ] && pdftoppm -jpeg -f 1 -singlefile "$FILE" "$CACHE"
        image_pv "$CACHE.jpg" && exit 1 ;;

    # *opendocument*)
    #     odt2txt "$FILE" && exit 1 ;;

    text/*)
        highlight -O ansi "$FILE" | fold -s -w "$PV_WIDTH" && exit 1
        cat "$FILE" | fold -s -w "$PV_WIDTH" && exit 1 ;;
esac

echo '----- File Type Classification -----' && 
file --dereference --brief -- "$FILE" | fold -s -w "$PV_WIDTH" && exit 1
