#!/bin/bash

apps=(
  "Firefox:firefox"
  "VSCodium:codium"
  "GIMP:gimp"
  "Audacity:audacity"
  "Galculator:galculator"
  "OBS:obs"
  "Time:~/.local/bin/clock_date.sh"
  "Blueman:blueman-manager"
  "ProtonVPN:protonvpn-app"
  "Prism Launcher:prismlauncher"
  "Steam:steam"
  "btop:btop"
  "VeraCrypt:veracrypt"
  "Only Office:flatpak run org.onlyoffice.desktopeditors"
  "WebCord:webcord"
  "Virt Machine Manager:virt-manager"
  "draw.io:drawio"
  "ClamTk:clamtk"
  "Tor Browser:tor-browser"
  "KdenLive:kdenlive"
)

choice=$(printf "%s\n" "${apps[@]}" | cut -d: -f1 | fzf --prompt="  ")

if [ -n "$choice" ]; then
    cmd=$(printf "%s\n" "${apps[@]}" | grep "^$choice:" | cut -d: -f2)

    # Executes the app, fully detaching it from the terminal
    setsid sh -c "$cmd >/dev/null 2>&1 &"
fi
