echo "⏻ "

if [ -n "$BLOCK_BUTTON" ]; then
    case "$BLOCK_BUTTON" in
        1)  # Linksklick
            rofi -c ~/.config/power-rofi/config.rasi -show powermenu -modi powermenu:/home/random/.config/i3blocks/power.sh
            ;;
        3)  # Rechtsklick (optional)
            notify-send "Right Click auf Power-Icon"
            ;;
    esac
fi
