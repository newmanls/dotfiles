#!/usr/bin/env bash

set -C -f

FILE_EXTENSION=$(echo "${f##*.}" | tr '[:upper:]' '[:lower:]')
FILE_MIMETYPE=$(file --dereference --brief --mime-type -- "$f")

case $FILE_MIMETYPE in
    text/*|application/json|inode/x-empty|application/pgp-encrypted)
        [ -z "$fs" ] && $EDITOR "$f" || $EDITOR -O $fs ;;

    image/x-xcf)
        setsid -f gimp "$f" >/dev/null 2>&1 ;;

    image/*)
        setsid -f nsxiv-rifle "$f" ;;

    *)
        for f in "$fx"; do setsid -f xdg-open "$f" > /dev/null 2>&1; done ;;
esac
