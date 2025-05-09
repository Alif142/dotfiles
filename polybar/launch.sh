#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do
    sleep 0.1
done

# Launch our main (and only) bar
polybar mybar &

echo "Polybar launched…"

