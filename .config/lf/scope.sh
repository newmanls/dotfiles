#!/bin/sh

set -C -f

file="$1"
file_extension=$(echo "${file##*.}" | tr '[:upper:]' '[:lower:]')
file_mimetype=$(file --dereference --brief --mime-type -- "${file}")

pv_width="$(($2-3))"
pv_height="$3"
pv_x="$(($4+1))"
pv_y="$5"

image_pv() {
    [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ] &&
        printf '{"action": "add", "identifier": "PREVIEW", "x": "%s", "y": "%s", "width": "%s", "height": "%s", "scaler": "contain", "path": "%s"}\n' "${pv_x}" "${pv_y}" "${pv_width}" "${pv_height}" "$1" > "$FIFO_UEBERZUG"
}

hash() {
    printf '%s/.cache/lf/thumb_%s' "$HOME" \
        "$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "${file}")" | \
        sha256sum | awk '{print $1}')"
}

wrap_text() {
    fold -s -w "${pv_width}"
}

# Handle extension
case "${file_extension}" in
    7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|iso|jar|lha|lz|lzh|lzma| \
    lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
        cache="$(hash "${file}")"
        [ ! -f "${cache}" ] && atool --list -- "${file}" > "${cache}"
        cat "${cache}" && exit 1 ;;
esac

# Handle mimetype
case "${file_mimetype}" in
    application/pdf)
        cache="$(hash)"
        [ ! -f "${cache}.jpg" ] && pdftoppm -jpeg -f 1 -singlefile "${file}" "${cache}"
        image_pv "${cache}.jpg" && exit 1 ;;

    video/*)
        cache="$(hash)"
        [ ! -f "${cache}" ] && ffmpegthumbnailer -i "${file}" -o "${cache}" -s 0
        image_pv "${cache}" && exit 1 ;;

    image/svg+xml)
        cache="$(hash).png"
        [ ! -f "${cache}" ] && convert -format png -background transparent -- "${file}" "${cache}"
        image_pv "${cache}" && exit 1 ;;

    image/*)
        image_pv "${file}" && exit 1 ;;

    # *opendocument*)
    #     odt2txt "${file}" && exit 1 ;;

    text/*|application/json)
        cat "${file}" | wrap_text && exit 1 ;;
esac

echo '----- File Type Classification -----' && 
file --dereference --brief -- "${file}" | wrap_text && exit 1
