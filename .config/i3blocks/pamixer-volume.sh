#!/usr/bin/env bash
# Depends on pamixer (pacat/pamixer from pulseaudio-ctl or package name pamixer)
# Supports: scroll up/down to change, left click toggle mute, middle click restore 50%

# Handle mouse buttons
if [[ -n "$BLOCK_BUTTON" ]]; then
  case "$BLOCK_BUTTON" in
    4) pamixer --increase 2 ;;    # scroll up
    5) pamixer --decrease 2 ;;    # scroll down
    1) pamixer --toggle-mute ;;   # left click
    2) pamixer --set-volume 50 ;; # middle click -> 50%
  esac
fi

# Get status
MUTE=$(pamixer --get-mute 2>/dev/null)
VOL=$(pamixer --get-volume 2>/dev/null)

# Fallbacks
if [[ -z "$VOL" ]]; then
  echo "no sound"
  echo "N/A"
  exit 0
fi

# Choose icon/text
if [[ "$MUTE" == "true" ]]; then
  ICON="🔇"
  COLOR="#888888"
else
  if (( VOL >= 66 )); then
    ICON="🔊"
  elif (( VOL >= 33 )); then
    ICON="🔉"
  else
    ICON="🔈"
  fi
  COLOR="#FFFFFF"
fi

FULL="$ICON ${VOL}%"
SHORT="${VOL}%"

echo "$FULL"
echo "$SHORT"
echo "$COLOR"
