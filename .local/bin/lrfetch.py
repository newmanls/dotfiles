#!/usr/bin/env python3

from os import environ
from os.path import expanduser
from subprocess import getoutput

def get_value(key, file):
    with open(file, "r") as file:
        for line in file:
            if key in line:
                return line.split("=")[1].strip(" \"\n")

def maxlen(list):
    maxlen = 0
    for item in list:
        item_len = len(item)
        if item_len > maxlen:
            maxlen = item_len
    return maxlen

def get_distro():
    distro = get_value("NAME", "/etc/os-release")
    return distro

def get_kernel():
    return getoutput("uname -r").strip()

def get_packages():
    packages = getoutput("pacman -Qq --color never").count("\n")
    return str(packages)

def get_shell():
    return environ["SHELL"].split("/")[-1]

def get_gtk_theme():
    config = expanduser("~/.config/gtk-3.0/settings.ini")
    theme = get_value("gtk-theme-name", config)
    return theme

def get_gtk_icons():
    config = expanduser("~/.config/gtk-3.0/settings.ini")
    theme = get_value("gtk-icon-theme-name", config)
    return theme

def get_term():
    term = getoutput("xdotool getwindowclassname $(xdotool getactivewindow)")
    return term.lower()

def get_wm():
    wm = getoutput("wmctrl -m").splitlines()[0].split(":")[1].strip()
    return wm

if __name__ == "__main__":
    info = {}
    info["os"] = get_distro()
    info["kernel"] = get_kernel()
    info["pkgs"] = get_packages()
    info["shell"] = get_shell()
    info["wm"] = get_wm()
    info["term"] = get_term()
    # info["theme"] = get_gtk_theme()
    # info["icons"] = get_gtk_icons()

    key_maxlen = maxlen(info.keys())
    value_maxlen = maxlen(info.values())

    print("╭─" + "─" * key_maxlen + "─┬─" + "─" * value_maxlen + "─╮")

    for key, value in info.items():
        print("│ {:>{}} │ {:<{}} │".format(key, key_maxlen, value, value_maxlen))

    print("╰─" + "─" * key_maxlen + "─┴─" + "─" * value_maxlen + "─╯")