#!/usr/bin/env bash
wallpapers=(~/hachi/Wallpaper/*.{jpg,jpeg,png,gif})
wall="${wallpapers[RANDOM % ${#wallpapers[@]}]}"
pgrep -x swww-daemon >/dev/null || swww-daemon &
sleep 1
swww img "$wall"
magick "$wall" ~/hachi/Wallpaper/keqing.jpg
