#!/usr/bin/env python3

from os import environ
from os.path import expanduser
from subprocess import getoutput

def get_value(key, file):
    with open(file, "r") as file:
        for line in file:
            if key in line:
                return line.split("=")[1].strip(" \"\n")

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
    term = getoutput("xdotool getactivewindow getwindowclassname")
    return term

def get_wm():
    wm = getoutput("wmctrl -m").splitlines()[0].split(":")[1].strip()
    return wm

def printcolors():
    for i in 3, 9:
        print()
        for j in range(8):
            print(" \033[0;{}{}m██".format(i, j), end="")
    print()
    print()

if __name__ == "__main__":
    info = {}
    info["os"] = get_distro()
    info["kernel"] = get_kernel()
    info["pkgs"] = get_packages()
    info["shell"] = get_shell()
    info["wm"] = get_wm()
    info["term"] = get_term()
    # info["theme"] = get_gtk_theme()
    info["icons"] = get_gtk_icons()

    print()
    for key, value in info.items():
        print(" \033[1;37m{}\t : \033[0;0m{}".format(key, value))

    printcolors()
