if [[ -z "$WAYLAND_DISPLAY" && -z "$SSH_CONNECTION" && "$XDG_VTNR" == 1 ]]; then
    start-hyprland
fi
