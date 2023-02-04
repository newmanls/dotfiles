#!/usr/bin/env bash

rofi \
    -show drun \
    -drun-display-format {name} \
    -theme "themes/${1:-appsmenu.rasi}" \
    -hover-select \
    -me-select-entry '' -me-accept-entry MousePrimary \
    -ml-row-up '' -kb-page-prev ScrollUp \
    -ml-row-down '' -kb-page-next ScrollDown
