#!/usr/bin/env bash

set -C -f

FILE_EXTENSION=$(echo "${f##*.}" | tr '[:upper:]' '[:lower:]')
FILE_MIMETYPE=$(file --dereference --brief --mime-type -- "$f")

# get_cache() {
#     CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/lf/thumb.$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$1" | sha256sum | awk '{print $1}')"
# }

case "$FILE_EXTENSION" in
    7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|iso|jar|lha|lz|lzh|lzma| \
    lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
        exit 0 ;;
esac

case $FILE_MIMETYPE in
    text/*|application/json|inode/x-empty| application/pgp-encrypted)
        [ -z "$fs" ] && $EDITOR "$f" || $EDITOR -O $fs ;;

    image/gif)
        setsid -f mpv --loop "$f" >/dev/null 2>&1 ;;

    image/x-xcf)
        setsid -f gimp "$f" >/dev/null 2>&1 ;;

    image/svg+xml)
        display -- "$f" ;;

    image/*)
        setsid -f nsxiv-rifle "$f" ;;

    *)
        for f in "$fx"; do
            setsid -f xdg-open "$f" >/dev/null 2>&1 &
        done ;;
esac
