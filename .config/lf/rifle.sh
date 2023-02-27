#!/usr/bin/env bash

set -C

case "$(file --dereference --brief --mime-type -- "$f")" in
    text/*|application/json|inode/x-empty|application/pgp-encrypted)
        [ -z "$fs" ] && ${EDITOR} "$f" || ${EDITOR} -O $fx ;;

    *document*)
        setsid -f zaread "$fx" > /dev/null 2>&1 ;;

    *)
        setsid -f xdg-open "$fx" > /dev/null 2>&1 ;;
esac
