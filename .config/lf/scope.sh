#!/bin/sh

set -C -f

FILE="$1"
FILE_EXTENSION=$(echo "${FILE##*.}" | tr '[:upper:]' '[:lower:]')
FILE_MIMETYPE=$(file --dereference --brief --mime-type -- "$FILE")

PV_WIDTH="$(($2-3))"
PV_HEIGHT="$3"
PV_X="$(($4+1))"
PV_Y="$5"

image_pv() {
    [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ] &&
        printf '{"action": "add", "identifier": "PREVIEW", "x": "%s", "y": "%s", "width": "%s", "height": "%s", "scaler": "contain", "path": "%s"}\n' "$PV_X" "$PV_Y" "$PV_WIDTH" "$PV_HEIGHT" "$1" > "$FIFO_UEBERZUG"
}

hash() {
    printf '%s/.cache/lf/thumb_%s' "$HOME" \
        "$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "$FILE")" | sha256sum | awk '{print $1}')"
}

# Handle extension
case "$FILE_EXTENSION" in
    7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|iso|jar|lha|lz|lzh|lzma| \
    lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
        CACHE="$(hash "$FILE")"
        [ ! -f "$CACHE" ] && atool --list -- "$FILE" > "$CACHE"
        cat "$CACHE" && exit 1 ;;
esac

# Handle mimetype
case "$FILE_MIMETYPE" in
    application/pdf)
        CACHE="$(hash)"
        [ ! -f "$CACHE.jpg" ] && pdftoppm -jpeg -f 1 -singlefile "$FILE" "$CACHE"
        image_pv "$CACHE.jpg" && exit 1 ;;

    video/*)
        CACHE="$(hash)"
        [ ! -f "$CACHE" ] && ffmpegthumbnailer -i "$FILE" -o "$CACHE" -s 0
        image_pv "$CACHE" && exit 1 ;;

    image/svg+xml)
        CACHE="$(hash).png"
        [ ! -f "$CACHE" ] && convert -format png -background transparent -- "$FILE" "$CACHE"
        image_pv "$CACHE" && exit 1 ;;

    image/*)
        image_pv "$FILE" && exit 1 ;;

    # *opendocument*)
    #     odt2txt "$FILE" && exit 1 ;;

    text/*)
        cat "$FILE" | fold -s -w "$PV_WIDTH" && exit 1 ;;
esac

echo '----- File Type Classification -----' && 
file --dereference --brief -- "$FILE" | fold -s -w "$PV_WIDTH" && exit 1
