#!/usr/bin/env python3
# dwm status script written in python
# Author: Newman Sanchez (https://github.com/newmanls)

import re
from datetime import datetime
from subprocess import run, PIPE
from time import sleep

LABELS = {
    "network_on": "󰛳  ",
    "network_off": "󰲛  ",
    "network_wifi_on": "󰤨  ",
    "network_wifi_off": "󰤭  ",
    "volume": "󰕾  ",
    "volume_muted": "󰸈  ",
}

def date():
    date = datetime.now().strftime("%a %b %d %H:%M")

    return date

def network():
    cmd = ["nmcli", "-t", "-g", "NAME,TYPE", "c", "s", "--active"]
    network = run(cmd, stdout=PIPE, text=True).stdout
    network_name, network_type = network.splitlines()[0].split(":")

    if re.search("ethernet", network_type):
        label = LABELS["network_on"]
    elif re.search("wireless", network_type):
        label = LABELS["network_wifi_on"]
    else:
        network_name = "disconnected"
        label = LABELS["network_off"]

    return label + network_name

def pulseaudio():
    cmd = ["pactl", "get-sink-mute", "0"]
    muted = run(cmd, stdout=PIPE, text=True).stdout.split(":")[1].strip()

    if muted == "yes":
        volume = "muted"
        label = LABELS["volume_muted"]
    else:
        cmd = ["pactl", "get-sink-volume", "0"]
        volume = run(cmd, stdout=PIPE, text=True).stdout.split("/")[1].strip()
        label = LABELS["volume"]

    return label + volume


if __name__ == "__main__":
    DEFAULT_MODULES = [ "pulseaudio", "network", "date" ]
    SEPARATOR = "  "

    modules = DEFAULT_MODULES

    while True:
        status = [eval(module)() for module in modules]
        run(["xsetroot", "-name", SEPARATOR.join(status)])
        sleep(0.5)