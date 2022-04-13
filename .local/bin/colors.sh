#!/bin/bash

cards() {
  s=$'\e[3'
  b=$'\e[9'
  m='m'
  c=$'\e[0m'
  w='7'

  for i in {0..1}; do
    for i in {0..7}; do
      echo -n "$s$i$m█████$c "
    done
    echo
  done
  for i in {0..7}; do
    echo -n "$b$w$m▀▀▀▀▀$c "
  done
  echo
}

circles() {
  s=$'\e[3'
  m='m'
  c=$'\e[0m'

  for i in {0..7}; do
    echo -n " $s$i$m$c "
  done
  echo
}

circles16() {
  s=$'\e[3'
  b=$'\e[9'
  m='m'
  c=$'\e[0m'

  for i in {0..7}; do
    echo -n " $s$i$m$c "
  done
  echo
  for i in {0..7}; do
    echo -n " $b$i$m$c "
  done
  echo
}

panes() {
  s=$'\e[3'
  b=$'\e[9'
  m='m'
  c=$'\e[0m'

  for i in {0..7}; do
    echo -n "$b$i$m████$s$i$m▄$c "
  done
  echo

  for i in {0..7}; do
    echo -n "$b$i$m████$s$i$m█$c "
  done
  echo

  for i in {0..7}; do
    echo -n "$s$i$m ▀▀▀▀$c "
  done
  echo
}

table() {
  T='•••' # The text for the color test

  echo -e "\n        def   40m   41m   42m   43m   44m   45m   46m   47m";

  for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
  '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
  '  36m' '1;36m' '  37m' '1;37m'; do
    FG=${FGs// /}
    echo -en " $FGs \033[$FG $T "

    for BG in 40m 41m 42m 43m 44m 45m 46m 47m; do
      echo -en "$EINS \033[$FG\033[$BG $T \033[0m";
    done
    echo
  done
  echo
}

squares() {
  s=$'\e[3'
  b=$'\e[9'
  m='m'
  c=$'\e[0m'

  echo
  for i in {0..7}; do
    echo -n " $b$i$m██$s$c"
  done
  echo

  for i in {0..7}; do
    echo -n " $s$i$m██$c"
  done
  echo
  echo
}

[[ $# -eq 0 ]] && echo "Avalible scripts: cards, circles, circles16, panes, table, squares."
[[ $# -eq 1 ]] && $1
