#!/bin/bash

bar="${@:-common}"

killall -q polybar

setsid -f polybar "${bar}" 2>&1 | tee -a /tmp/polybar.log

echo "Polybar launched..."
