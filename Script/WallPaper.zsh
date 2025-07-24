#!/usr/bin/env bash

shopt -s nullglob
wallpapers=(~/hachi/Wallpaper/*.jpg ~/hachi/Wallpaper/*.jpeg ~/hachi/Wallpaper/*.png ~/hachi/Wallpaper/*.gif)

if [ ${#wallpapers[@]} -eq 0 ]; then
  echo "❌ No wallpapers found in ~/hachi/Wallpaper"
  exit 1
fi

wall="${wallpapers[RANDOM % ${#wallpapers[@]}]}"

pgrep -x swww-daemon >/dev/null || swww-daemon &

sleep 1
swww img "$wall"

magick "$wall" ~/hachi/Wallpaper/keqing.jpg
