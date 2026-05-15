-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function () 
  hl.exec_cmd("waybar")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("cliphist wipe")
  hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface font-name 'SF Pro, 11'")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'WhiteSur'")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor- theme 'BreezeX-RosePine-Linux'")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 28")
end)
