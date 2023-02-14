#!/usr/bin/env bash

set -Ceo pipefail

case "$(file --dereference --brief --mime-type -- "$f")" in
    text/*|application/json|inode/x-empty|application/pgp-encrypted)
        [ -z "$fs" ] && ${EDITOR} "$f" || ${EDITOR} -O $fx ;;

    *document*)
        setsid -f zaread "$f" ;;

    *)
        setsid -f xdg-open "$f" > /dev/null 2>&1 ;;
esac
