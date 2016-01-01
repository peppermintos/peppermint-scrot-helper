#!/bin/bash


shot_dir="$HOME/Pictures/Screenshots";

shot_file=$(zenity --title="Screen Capture" --forms title="Filename to save" \
    --text="NOTE: The file will be stored in /home/USERNAME/Pictures/Screenshots" \
    --add-entry="Save as" \
    --separator=":");

shot_type=$(zenity --title="Screen capture" --list --text "Choose your screenshot type:" --radiolist \
    --column "Select" --column "Options" \
    TRUE "Fullscreen" \
    FALSE "Mouse Selection" \
    --separator=":");

if [ ! -d $shot_dir ]; then
    mkdir -p "$shot_dir";
fi

cd "$shot_dir";

case $shot_type in
    "Fullscreen") 
        scrot "$shot_file"
        ;;
    "Mouse Selection")
        scrot -s "$shot_file"
        ;;
    *)
        scrot "$shot_file"
esac
