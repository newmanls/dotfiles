#!/usr/bin/env bash

set -C -f

file_extension=$(echo "${f##*.}" | tr '[:upper:]' '[:lower:]')
file_mimetype=$(file --dereference --brief --mime-type -- "$f")

hash() {
    printf '%s/.cache/lf/thumb_%s' "$HOME" \
        "$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "$f")" | \
        sha256sum | awk '{print $1}')"
}

case ${file_mimetype} in
    *document*)
        cache="$(hash).pdf"
        [ ! -f "${cache}" ] &&
            libreoffice --convert-to pdf --outdir "$HOME/.cache/lf" "${f}" &&
            mv "$HOME/.cache/lf/$(basename ${f/.*/.pdf})" "${cache}"
        setsid -f zathura "${cache}" ;;

    text/*|application/json|inode/x-empty|application/pgp-encrypted)
        [ -z "$fs" ] && $EDITOR "$f" || $EDITOR -O $fs ;;

    image/x-xcf)
        setsid -f gimp "$f" >/dev/null 2>&1 ;;

    image/*)
        setsid -f nsxiv-rifle "$f" ;;

    *)
        for f in "$fx"; do setsid -f xdg-open "$f" > /dev/null 2>&1; done ;;
esac
