#!/usr/bin/env python3
# dwm status script written in python
# Author: Newman Sanchez (https://github.com/newmanls)

from datetime import datetime
from os import environ
from shutil import which
from subprocess import run, getoutput
from time import sleep

MODULES = {
    "cmus": "cmus-remote",
    "date": "",
    "network": "nmcli",
    "pulseaudio": "pactl",
}
LABELS = {
    "date": "",
    "music": "󰎈  ",
    "network_on": "󰛳  ",
    "network_off": "󰲛  ",
    "network_wifi_on": "󰤨  ",
    "network_wifi_off": "󰤭  ",
    "volume": "󰝚  ",
    "volume_muted": "󰝛  ",
}
SEPARATOR = "  "

def check_modules(defined_modules):
    modules = []
    for module in defined_modules:
        if module not in MODULES:
            warning = "WARNING: '{}' is not a valid module. "
            warning += "It will be disabled."
            print(warning.format(module))
        elif module != "date" and not which(MODULES[module]):
            warning = "WARNING: '{}' is not installed. "
            warning += "'{}' module will be disabled."
            print(warning.format(MODULES[module], module))
        else:
            modules.append(module)

    return modules

def cmus():
    keys = ["status", "file", "tag title", "tag artist"]
    info = {}

    for line in getoutput("cmus-remote -Q").splitlines():
        for key in keys:
            if line.startswith(key + " "):
                info[key.removeprefix("tag ")] = line.removeprefix(key).strip()

    if info.get("status") and info["status"] != "stopped":
        if info.get("title") and info.get("artist"):
            output = "{} - {}".format(info["artist"], info["title"])
        else:
            output = info["file"].split("/")[-1]

        return LABELS["music"] + output

def date():
    date = datetime.now().strftime("%a %b %d %H:%M")
    label = LABELS["date"]

    return label + date

def network():
    network = getoutput("nmcli -t -g NAME,TYPE connection show --active")
    network_name, network_type = network.splitlines()[0].split(":")

    if network_type.endswith("ethernet"):
        label = LABELS["network_on"]
    elif network_type.endswith("wireless"):
        label = LABELS["network_wifi_on"]
    else:
        network_name = "disconnected"
        label = LABELS["network_off"]

    return label + network_name

def pulseaudio():
    muted = getoutput("pactl get-sink-mute 0").split(":")[1].strip()

    if muted == "yes":
        volume = "muted"
        label = LABELS["volume_muted"]
    else:
        volume = getoutput("pactl get-sink-volume 0").split("/")[1].strip()
        label = LABELS["volume"]

    return label + volume

if __name__ == "__main__":
    if "DWMSB_MODULES" in environ:
        modules = environ["DWMSB_MODULES"].split()
    else:
        modules = ["pulseaudio", "network", "date"]

    modules = check_modules(modules)

    while True:
        status = [eval(module)() for module in modules]
        status = [item for item in status if type(item) is str]
        run(["xsetroot", "-name", SEPARATOR.join(status)])
        sleep(0.25)
