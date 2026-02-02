#!/bin/bash

SINK="@DEFAULT_SINK@"
STEP=5
MAX=100

# Aktuelle Lautstärke (nur Zahl)
vol=$(pactl get-sink-volume "$SINK" | awk '{print $5}' | head -n1 | tr -d '%')

# Klicks / Scrollen
case $BLOCK_BUTTON in
    1)
        pactl set-sink-mute "$SINK" toggle
        ;;
    4)
        if [ "$vol" -lt "$MAX" ]; then
            new_vol=$((vol + STEP))
            [ "$new_vol" -gt "$MAX" ] && new_vol=$MAX
            pactl set-sink-volume "$SINK" "${new_vol}%"
        fi
        ;;
    5)
        new_vol=$((vol - STEP))
        [ "$new_vol" -lt 0 ] && new_vol=0
        pactl set-sink-volume "$SINK" "${new_vol}%"
        ;;
esac

# Ausgabe
if pactl get-sink-mute "$SINK" | grep -q yes; then
    echo "🔇 Muted"
else
    echo "🔊 ${vol}%"
fi

