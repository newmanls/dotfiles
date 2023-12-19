#!/usr/bin/env python3
# dwm status script written in python
# Author: Newman Sanchez (https://github.com/newmanls)

from datetime import datetime
from os import environ, path
from shutil import which
from subprocess import run, getoutput
from time import sleep

MODULES = {
    "battery": "BAT1",
    "cmus": "cmus-remote",
    "date": "",
    "network": "nmcli",
    "pulseaudio": "pactl",
}

LABELS = {
    "battery_full": "󰁹",
    "battery_high": "󰂁",
    "battery_medium": "󰁿",
    "battery_low": "󰁽",
    "battery_alert": "󰂃",
    "battery_charging": "󰂄",
    "date": "",
    "music": "󰎈 ",
    "music_playing": "󰐊 ",
    "music_paused": "󰏤 ",
    "network_on": "󰛳  ",
    "network_off": "󰲛  ",
    "network_wifi_on": "󰤨  ",
    "network_wifi_off": "󰤭  ",
    "volume": "󰝚  ",
    "volume_muted": "󰝛  ",
}
SEPARATOR = "   "


def check_modules(defined_modules):
    modules = []
    battery = '/sys/class/power_supply/{}/'.format(MODULES['battery'])

    for module in defined_modules:
        if module not in MODULES:
            warning = "WARNING: '{}' is not a valid module. "
            warning += "It will be disabled."
            print(warning.format(module))
        elif module == 'battery' and not path.exists(battery):
            warning = "WARNING: '{}' not detected. "
            warning += "'battery' module will be disabled."
            print(warning.format(MODULES['battery']))
        elif module not in ('date', 'battery') and not which(MODULES[module]):
            warning = "WARNING: '{}' is not installed. "
            warning += "'{}' module will be disabled."
            print(warning.format(MODULES[module], module))
        else:
            modules.append(module)

    return modules


def battery():
    battery = '/sys/class/power_supply/{}/'.format(MODULES['battery'])

    status = open(path.join(battery, 'status')).read().strip()
    capacity = int(open(path.join(battery, "capacity")).read())

    if status == 'Charging':
        label = LABELS['battery_charging']
    elif capacity >= 80:
        label = LABELS['battery_full']
    elif capacity >= 60:
        label = LABELS['battery_high']
    elif capacity >= 40:
        label = LABELS['battery_medium']
    elif capacity >= 20:
        label = LABELS['battery_low']
    else:
        label = LABELS['battery_alert']

    return '{} {}%'.format(label, capacity)


def cmus():
    keys = ["status", "file", "tag title", "tag artist", "stream"]
    info = {}

    for line in getoutput("cmus-remote -Q").splitlines():
        for key in keys:
            if line.startswith(key + " "):
                info[key.removeprefix("tag ")] = line.removeprefix(key).strip()

    if "status" in info and info["status"] != "stopped":
        if "stream" in info:
            output = info["stream"]
        elif "title" and "artist" in info:
            output = "{} - {}".format(info["artist"], info["title"])
        else:
            output = info["file"].split("/")[-1]

        if info["status"] == "playing":
            label = LABELS["music_playing"]
        elif info["status"] == "paused":
            label = LABELS["music_paused"]
        else:
            label = LABELS["music"]

        return label + output


def date():
    return LABELS["date"] + datetime.now().strftime("%a %b %d %H:%M")


def network():
    output = getoutput("nmcli -t -g NAME,TYPE connection show --active")
    networks = [i for i in output.splitlines() if not i.startswith('lo:')]

    try:
        network_name, network_type = networks[0].split(":")
    except:
        network_name, network_type = "disconnected", "none"

    if network_type.endswith("ethernet"):
        label = LABELS["network_on"]
    elif network_type.endswith("wireless"):
        label = LABELS["network_wifi_on"]
    else:
        label = LABELS["network_off"]

    return label + network_name


def pulseaudio():
    muted = getoutput(
        "pactl get-sink-mute @DEFAULT_SINK@").removeprefix("Mute: ")

    if muted == "yes":
        volume = "muted"
        label = LABELS["volume_muted"]
    else:
        volume = getoutput(
            "pactl get-sink-volume @DEFAULT_SINK@").split("/")[1].strip()
        label = LABELS["volume"]

    return label + volume


if __name__ == "__main__":
    try:
        modules = environ["DWMSB_MODULES"].split()
    except:
        modules = ['cmus', 'battery', 'pulseaudio', 'network', 'date']

    modules = check_modules(modules)

    while True:
        output = [eval(module)() for module in modules]
        status = SEPARATOR.join([item for item in output if type(item) is str])
        run(["xprop", "-root", "-set", "WM_NAME", " {} ".format(status)])
        sleep(0.25)
