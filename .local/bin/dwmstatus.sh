#!/usr/bin/env bash

while true; do
    xsetroot -name " $(sb-volume)  $(sb-battery)  $(sb-network)  $(sb-date) "
    sleep 0.5s 
done
