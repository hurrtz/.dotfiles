#!/usr/bin/env bash

killall -q polybar

# wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

polybar main 2>&1 | tee -a /tmp/polybar_main.log & disown
polybar secondary 2>&1 | tee -a /tmp/polybar_secondary.log & disown

echo "bars launched..."
