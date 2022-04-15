#/usr/bin/env bash
set -f

BOLD=$(tput bold)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
WHITE=$(tput setf 7)
NORMAL=$(tput sgr0)

echomsg() {
    lf -remote "send $id echomsg $1"
}

if [ $# -eq 1 ]; then
    read -n1 -p "${BOLD}${GREEN}==>${WHITE} $1 [y/N] ${NORMAL}" answer
    clear
    [ -n $answer -a $answer = 'y' ] && exit 0 || exit 1

else
    if [ $1 -eq 0 ]; then
        echomsg "${GREEN}$2${NORMAL}"
    else
        echomsg "${RED}$3${NORMAL}"
    fi
fi

