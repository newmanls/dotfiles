#!/usr/bin/env python3
# dwm status script written in python
# Author: Newman Sanchez (https://github.com/newmanls)

from datetime import datetime
from os import environ
from shutil import which
from subprocess import run, getoutput
from time import sleep

DEFAULT_MODULES = ["cmus", "pulseaudio", "network", "date"]
MODULES_CMD = {
    "cmus": "cmus-remote",
    "network": "nmcli",
    "pulseaudio": "pactl",
    "date": "",
}
LABELS = {
    "network_on": "󰛳  ",
    "network_off": "󰲛  ",
    "network_wifi_on": "󰤨  ",
    "network_wifi_off": "󰤭  ",
    "volume": "󰝚  ",
    "volume_muted": "󰝛  ",
    "music": "󰎈  "
}
MODULE_SEPARATOR = "  "

def check_modules(modules):
    for module in modules:
        if module == "date":
            continue
        try:
            DEFAULT_MODULES.index(module)
        except:
            warning = "WARNING: '{}' is not a valid module. It will be disabled"
            print(warning.format(module))
            modules.remove(module)
            continue

        if not which(MODULES_CMD[module]):
            warning = "WARNING: '{}' is not installed. "
            warning += "'{}' module will be disabled."
            print(warning.format(MODULES_CMD[module], module))
            modules.remove(module)

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

    return date

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
    modules = environ["DWMSB_MODULES"].split() if "DWMSB_MODULES" in environ \
        else DEFAULT_MODULES

    modules = check_modules(modules)

    while True:
        status = [eval(module)() for module in modules]
        status = [item for item in status if type(item) is str]
        run(["xsetroot", "-name", MODULE_SEPARATOR.join(status)])
        sleep(0.25)
